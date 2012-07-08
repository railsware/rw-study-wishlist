require 'resque/tasks'
namespace :resque do
  task :setup => :environment

  # From https://gist.github.com/1870642
  desc "Restart running workers"
  task :restart_workers => :environment do
    Rake::Task['resque:stop_workers'].invoke
    Rake::Task['resque:start_workers'].invoke
  end

  desc "Quit running workers"
  task :stop_workers => :environment do
    stop_workers
  end

  desc "Start workers"
  task :start_workers => :environment do
    run_worker("*", 3)
  end

  def store_pids(pids, mode)
    pids_to_store = pids
    pids_to_store += read_pids if mode == :append

    # Make sure the pid file is writable.
    File.open(File.expand_path('tmp/pids/resque.pid', Rails.root), 'w') do |f|
      f <<  pids_to_store.join(',')
    end
  end

  def read_pids
    pid_file_path = File.expand_path('tmp/pids/resque.pid', Rails.root)
    return []  if ! File.exists?(pid_file_path)

    File.open(pid_file_path, 'r') do |f|
      f.read
    end.split(',').collect {|p| p.to_i }
  end

  def stop_workers
    pids = read_pids

    if pids.empty?
      puts "No workers to kill"
    else
      syscmd = "kill -s QUIT #{pids.join(' ')}"
      puts "$ #{syscmd}"
      `#{syscmd}`
      store_pids([], :write)
    end
  end

  # Start a worker with proper env vars and output redirection
  def run_worker(queue, count = 1, ops = {})
    puts "Starting #{count} worker(s) with QUEUE: #{queue}"

    queues = queue.split(',')

    # Get the git commit hash for later
    commit_hash = `cd #{Rails.root.to_s} && git rev-parse HEAD`[0,12]

    pids = []
    child = false

    # Clear current mysql connection, ready to fork
    ::ActiveRecord::Base.clear_all_connections!
    count.times do
      pid = Process.fork
      if pid.nil? then
        # In child
        child = true

        # Keep alive after parent process detaches from the terminal
        Signal.trap('HUP', 'IGNORE')

        # Restablish a mysql connection
        ::ActiveRecord::Base.establish_connection

        # Set up the new Resque worker
        worker = Resque::Worker.new(*queues)
        worker.verbose = false
        worker.very_verbose = false
        worker.log "Starting worker #{worker}"
        worker.work(5)

        # Add commit hash to worker name
        $0 = "resque-#{Resque::Version}: #{queues} (@#{commit_hash})"

        # Don't continue the loop in this child
        break
      else
        # In parent
        child = false

        # We don't care about the forked process
        Process.detach(pid)
        pids << pid
      end
    end

    # Only store if we're in the parent process
    store_pids(pids, :append) unless child
  end
end

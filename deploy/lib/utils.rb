require 'colors'

module Utils
  module CLI
    class << self
      def ask_stage_name(stages)
        available_stages = stages.keys.reject {|s| s.match('production')}
        puts blue("Available stage list:") +" "+ green(available_stages.join(', '))
        stage_name = Capistrano::CLI.ui.ask("choose one: ")
        if available_stages.include?(stage_name)
          puts "We will deploy to #{red(stages[stage_name]['domain'])} server"
        else
          puts red("You must enter proper stage from next list:") +" "+ green(available_stages.join(', '))
          exit 1
        end
        stage_name
      end

      def ask_branch_name(default_branch=nil)
        default_branch = ENV['BRANCH'] || default_branch || 'master'
        branch = Capistrano::CLI.ui.ask("Enter tag or branch to deploy (#{default_branch} is default):")
        branch = default_branch if branch.nil? || branch.empty?
        puts green("Deploying ") + yellow(branch) + green(" branch")
        branch
      end

      def puts_congratulitions(stage_name, branch)
        sentence = "Branch #{blue(branch)} has been #{green('successfully')} deployed on #{blue(stage_name)}"
        length = sentence.size - 27 # size of spec chars
        title = "Congratulations!"
        title_shift = ' ' * ((length - title.size) / 2)
        puts
        puts "=" * length
        puts  title_shift + title
        puts sentence
        puts "=" * length
        puts
      end
    end
  end
end

class CreateFriends
 @queue = :simple

 def self.perform
    puts "CreatFriends is done"
 end
end

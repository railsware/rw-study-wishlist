class CreateFriends
 @queue = :simple

 def self.perform(person_id, token)
 	puts "CreatFriends: started"
    @app = VkontakteApi::Client.new(token)
    puts "CreatFriends: VK api client initialize successful"
	friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo_medium_rec')
	person = Person.find(person_id)
	Person.create_friends friends_hashes, person
	puts "CreatFriends: model method 'create_friends' worked successful"
    puts "CreatFriends: finished"
    puts "--------------------------------------------------------------"
 end
end

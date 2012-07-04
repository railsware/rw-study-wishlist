class CreateFriends
 @queue = :simple

 def self.perform(person_id, token)
    @app = VkontakteApi::Client.new(token)
	friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo_medium_rec')
	person = Person.find(person_id)
	Person.create_friends friends_hashes, person
    puts "CreatFriends is done"
 end
end

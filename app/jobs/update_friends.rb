class UpdateFriends
 @queue = :simple

 def self.perform(person_id, token)
    person = Person.find(person_id)
    friends = person.friendships.collect {|f| f.friend}
    b = false
    friends.each do |f|
    	d_updated = DateTime.strptime(f.updated_at.strftime('%d.%m.%y %H:%M:%S'), '%d.%m.%y %H:%M:%S')
    	d_now = DateTime.strptime(DateTime.now.strftime('%d.%m.%y %H:%M:%S'), '%d.%m.%y %H:%M:%S')
    	if (d_now - d_updated).to_int > 0
    	puts "UpdateFriends is done 1"
    	@app = VkontakteApi::Client.new(token)
    	puts "UpdateFriends is done 2"
    	friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo_medium_rec')
    	puts "UpdateFriends is done 3"
    	Person.update_friends friends_hashes, person
    	puts "UpdateFriends is done 4"
    	return
    	end
    end   
    puts "UpdateFriends is done without http request"
 end
end

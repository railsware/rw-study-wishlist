class UpdateFriends
 @queue = :simple

 def self.perform(person_id, token)
    puts "UpdateFriends: started"
    person = Person.find(person_id)
    friends = person.friendships.collect {|f| f.friend}
    b = false
    friends.each do |f|
    	d_updated = DateTime.strptime(f.updated_at.strftime('%d.%m.%y %H:%M:%S'), '%d.%m.%y %H:%M:%S')
    	d_now = DateTime.strptime(DateTime.now.strftime('%d.%m.%y %H:%M:%S'), '%d.%m.%y %H:%M:%S')
    	if (d_now - d_updated).to_int > 0
    		@app = VkontakteApi::Client.new(token)
    		puts "UpdateFriends: VK api client initialize successful"
    		friends_hashes = @app.friends.get(fields: 'uid, first_name, last_name, bdate, photo_medium_rec')
    		puts "UpdateFriends: get friends from api successful"
    		Person.update_friends friends_hashes, person
    		puts "UpdateFriends: model method 'update_friends' worked successful"
    		puts "UpdateFriends: finished"
    		puts "--------------------------------------------------------------"
    		return
    	end
    end   
    puts "UpdateFriends: finished without http request"
    puts "--------------------------------------------------------------"

 end
end

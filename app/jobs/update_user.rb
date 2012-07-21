class UpdateUser
 @queue = :simple

 def self.perform(person_id, vk_id, token)
 	puts "UpdateUser: started"
    person = Person.find(person_id) 
    @app = VkontakteApi::Client.new(token)
    current_user_hash = @app.users.get(uids: vk_id, fields: 'bdate,photo_medium_rec').first
    person.update_attributes(:avatar => open(current_user_hash[:photo_medium_rec]),
    						 :vk_avatar_url => current_user_hash[:photo_medium_rec],
    						 :birthday =>
	     						 	if current_user_hash[:bdate] == nil
	     						 	  nil 
	     						 	else
	     						   	  if current_user_hash[:bdate].length > 5
	     						     	DateTime.strptime(current_user_hash[:bdate], '%d.%m.%Y')
	     							  else
	     						     	DateTime.strptime(current_user_hash[:bdate], '%d.%m')
	     						 	  end 
	     						 	end)
    puts "UpdateUser: finished"
    puts "--------------------------------------------------------------"
 end
end

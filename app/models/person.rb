# == Schema Information
#
# Table name: people
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)
#  birthday            :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  vk_id               :string(255)
#  email               :string(255)
#  privacy_type        :string(255)
#  is_user             :boolean(1)
#  role                :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

class Person < ActiveRecord::Base
  set_table_name "people"

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :wishes
  has_many :reservation

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  attr_accessible :vk_id, :name, :is_user, :birthday, :avatar


  def self.find_for_vkontakte_oauth access_token, friends_hashes
    if person = Person.where(:vk_id => access_token.uid, :is_user => true).first
      person
    else
	  if Person.where(:vk_id => access_token.uid, :is_user => false).first
		Person.transaction do
          i = Person.where(:vk_id => access_token.uid, :is_user => false).first
  		  i.is_user = true
  		  i.save
		end
		Person.create_friends friends_hashes
		person = Person.where(:vk_id => access_token.uid).first
	  else
    	person = Person.create!(:is_user => true, :name => access_token.info.name,
					   :birthday => access_token.extra.raw_info.bdate, :vk_id => access_token.uid)
					   #:avatar => access_token.info.image)
		Person.create_friends friends_hashes
		person
	  end 
    end
  end 

  def self.create_friends friends_hashes
    friends_hashes.each do |hash|
	  if Person.where(:vk_id => hash[:uid]).first == nil
	    Person.create!(:is_user => false, :name =>hash[:first_name] + " " + hash[:last_name],:birthday => hash[:bdate], :vk_id => hash[:uid])
                       #:avatar => hash[:photo])	
	  end	
    end
  end
end

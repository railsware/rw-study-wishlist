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
require "open-uri"
class Person < ActiveRecord::Base
  set_table_name "people"
  attr_accessible :name, :birthday, :vk_id, :email, :is_user, :role
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :wishes, :foreign_key => 'owner_id'
  has_many :reservation
  
  default_scope :order => 'is_user DESC'
  has_attached_file :avatar, :styles => { :big => "200x200", :medium => "150x150>", :small => "50x50>" }
  
  
  attr_accessible :vk_id, :name, :is_user, :birthday, :avatar


  def self.find_for_vkontakte_oauth access_token, friends_hashes
    if person = Person.where(:vk_id => access_token.uid, :is_user => true).first
       person
    else
	  if person = Person.where(:vk_id => access_token.uid, :is_user => false).first
  		person.is_user = true
  		person.save
		Person.create_friends friends_hashes, person
		person
	  else
    		person = Person.create!(:is_user => true, :name => access_token.info.name, :birthday =>
    								if access_token.extra.raw_info.bdate == nil
    								  nil
    								else
	     						      if access_token.extra.raw_info.bdate.length > 5
	     						        DateTime.strptime(access_token.extra.raw_info.bdate, '%d.%m.%Y')
	     						      else
	     						        DateTime.strptime(access_token.extra.raw_info.bdate, '%d.%m')
	     						      end
    								end,
    								:vk_id => access_token.uid)
    	person.update_attribute(:avatar,open(access_token.extra.raw_info.photo_big))
		Person.create_friends friends_hashes, person
		person
	  end 
    end
  end 

  def self.create_friends friends_hashes, person
    friends_hashes.each do |hash|
	  if Person.where(:vk_id => hash[:uid]).first == nil
	     friend = Person.create!(:is_user => false, :name =>hash[:first_name] + " " + hash[:last_name], :birthday => 
	     						 if hash[:bdate] == nil
	     						   nil 
	     						 else
	     						   if hash[:bdate].length > 5
	     						     DateTime.strptime(hash[:bdate], '%d.%m.%Y')
	     						   else
	     						     DateTime.strptime(hash[:bdate], '%d.%m')
	     						   end 
	     						 end,
	     						 :vk_id => hash[:uid])
	  friend.update_attribute(:avatar,open(hash[:photo_big]))  
	  end
	  Friendship.create!(:person_id => person.id, :friend_id => friend.id )
    end
  end
end

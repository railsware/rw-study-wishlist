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
  
  attr_accessible :vk_id, :name, :is_user

  def self.find_for_vkontakte_oauth access_token
    if person = Person.where(:vk_id => access_token.extra.raw_info.domain).first
      person
    else 
      Person.create!(:is_user => true, :name => access_token.info.name, :vk_id => access_token.extra.raw_info.domain) 
    end
  end 
end

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
  attr_accessible :name, :birthday, :vk_id, :email, :is_user, :role
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :wishes
  has_many :reservation

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :name, :presence => true, :length => {:in => 2..50}
  validates :vk_id, :presence => true, :uniqueness => true
  validates :email, :presence => true, :format =>  {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :role, :presence => true, :inclusion => { :in => ["admin", "user"] }

end

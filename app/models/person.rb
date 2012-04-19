class Person < ActiveRecord::Base
  set_table_name "people"

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :wishes
  has_many :reservation
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

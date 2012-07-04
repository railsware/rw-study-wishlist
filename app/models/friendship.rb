# == Schema Information
#
# Table name: friendships
#
#  id         :integer(4)      not null, primary key
#  person_id  :string(255)
#  friend_id  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Friendship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, :class_name => "Person"
  
  attr_accessible :person_id, :friend_id, :wish_num
end



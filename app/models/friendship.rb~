class Friendship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, :foreign_key => "friend_id", :class_name => "Person"
end

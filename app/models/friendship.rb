class Friendship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, :class_name => "Person"
end

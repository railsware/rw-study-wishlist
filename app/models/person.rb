class Person < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :wishes
  has_many :reservation
end

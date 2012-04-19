class Wish < ActiveRecord::Base
  belongs_to :owner, :class_name => 'Person'
  has_one :reservation
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

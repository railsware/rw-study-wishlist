# == Schema Information
#
# Table name: wishes
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  url                :string(255)
#  description        :text
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  owner_id           :integer(4)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  rating             :integer(4)
#

class Wish < ActiveRecord::Base
  attr_accessible :name, :url, :description, :rating, :owner_id
  belongs_to :owner, :class_name => 'Person'
  has_one :reservation
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :name, :presence => true, :length => {:in => 2..50}
  validates :url, :presence => true, :format =>  {:with => /^((http|https|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }
  validates :owner_id, :presence =>  true
  validates :rating, :presence => true, :inclusion => {:in => 1..5}

  
end

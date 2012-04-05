class Wish < ActiveRecord::Base
  belongs_to :person
  has_one :reservation;
end

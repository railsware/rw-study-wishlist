# == Schema Information
#
# Table name: reservations
#
#  id               :integer(4)      not null, primary key
#  wish_id          :integer(4)
#  person_id        :integer(4)
#  reservation_date :datetime
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Reservation < ActiveRecord::Base
 belongs_to :person
 belongs_to :wish
end

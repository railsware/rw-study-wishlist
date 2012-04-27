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

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

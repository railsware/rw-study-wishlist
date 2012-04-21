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

require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

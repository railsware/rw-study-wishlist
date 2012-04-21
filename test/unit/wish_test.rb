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
#

require 'test_helper'

class WishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

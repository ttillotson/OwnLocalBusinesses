# == Schema Information
#
# Table name: businesses
#
#  id         :bigint(8)        not null, primary key
#  uuid       :string
#  name       :string
#  address    :string
#  address2   :string
#  city       :string
#  state      :string
#  zip        :bigint(8)
#  country    :string
#  phone      :bigint(8)
#  website    :string
#  created_at :datetime
#

require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

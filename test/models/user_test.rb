# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  user_id         :integer
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

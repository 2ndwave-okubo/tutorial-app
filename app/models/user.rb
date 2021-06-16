# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  user_id         :integer
#
class User < ApplicationRecord
    has_secure_password
    def blogs
        return Post.where(user_id: self.id)
    end
end

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
class User < ApplicationRecord
    is_impressionable
    has_secure_password
    has_many :blogs
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :like_blogs, through: :likes, source: :blog
    
    
    def blogs
        return Blog.where(user_id: self.id)
    end
    def already_liked?(blog)
        self.likes.exists?(blog_id: blog.id)
    end
end

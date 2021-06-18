# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_blog_id  (blog_id)
#  index_likes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (blog_id => blogs.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord

  validates_uniqueness_of :blog_id, scope: :user_id
end

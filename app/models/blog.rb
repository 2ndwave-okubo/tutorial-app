# == Schema Information
#
# Table name: blogs
#
#  id                  :bigint           not null, primary key
#  body(本文)          :text(65535)      not null
#  impressions_count   :integer          default(0)
#  title(タイトル)     :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
class Blog < ApplicationRecord
    belongs_to :user
    is_impressionable counter_cache: true
    validates :title, presence: true, length: { minimum: 1, maximum: 50}
    validates :body, presence: true, length: { minimum:10, maximum: 5000 }
    validates :user_id, {presence: true}
    has_many :comments, :dependent => :destroy 
    has_many :likes, :dependent => :destroy 
    has_many :liked_users, through: :likes, source: :user

    
    
    scope :search, -> (params) do
        scope = self
        if params[:search_title].present?
          scope = scope.search_by_title(params[:search_title])
        end
        scope
    end
    
    scope :search_by_title, -> (value) do
      where("`title` LIKE ?", "%#{value}%")
    end

    def liked_by?(user)
      likes.where(user_id: user.id).exists?
    end
    
    
    
end

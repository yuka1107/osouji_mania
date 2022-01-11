class PostArticle < ApplicationRecord
  belongs_to :user
  attachment :image

  # コメント機能
  has_many :post_comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validatable :user_id, presence: true
  validatable :title, presence: true, length: { maximum: 50 }
  validatable :caption, presence: true, length: { maximum: 200 }
end

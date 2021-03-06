# post_articles テーブル
# id         :bigint not null, primary key
# user_id    :integer
# image      :string
# title      :text
# caption    :text
# is_active  :boolean
# user       :references foreign_key: true
# created_at :detetime not null
# updated_at :detetime not null

class PostArticle < ApplicationRecord
  # ユーザーと紐づけ
  belongs_to :user

  # 画像アップロード
  attachment :image

  # タグ機能
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nill?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      post_tags.delete PostTag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = PostTag.find_or_create_by(name: new)
      post_tags << new_post_tag
    end
  end

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

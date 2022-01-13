class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # プロフィール画像

  # 投稿記事
  has_many :post_articles, dependent: :destroy

  # コメント機能
  has_many :post_comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  # カレンダー機能
  has_many :events, dependent: :destroy

  def active_for_authentication?
    super && (is_active == true)
  end
end

class PostArticle < ApplicationRecord
  belongs_to :user
  attachment :image

  validatable :user_id, presence: true
  validatable :title, presence: true, length: { maximum: 50 }
  validatable :caption, presence: true, length: { maximum: 200 }
end

class PostTag < ApplicationRecord
  belongs_to :post_article
  belongs_to :tag

  validates :post_article_id, presence: true
  validates :tag_id, presence: true
end

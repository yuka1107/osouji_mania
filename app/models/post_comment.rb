# post_comments テーブル
# id              :bigint not null, primary key
# user_id         :integer
# post_article_id :integer
# comment         :text
# created_at      :detetime not null
# updated_at      :detetime not null
class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_article
end

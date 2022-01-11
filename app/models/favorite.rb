# favorite テーブル
# id              :bigint   not null, primary key
# user_id         :integer
# post_article_id :integer
# created_At      :detetime not null
# update_at       :detetime not null

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_article
end

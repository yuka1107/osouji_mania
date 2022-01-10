class CreatePostArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :post_articles do |t|
      t.integer :user_id
      t.string :image
      t.text :title
      t.text :caption
      t.boolean :is_active

      t.timestamps
    end
  end
end

class RenameImageColumnToPostArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_articles, :image, :image_id
  end
end

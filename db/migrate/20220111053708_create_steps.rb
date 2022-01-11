class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :post_article, null: false, foreign_key: true
      t.string :image
      t.text :body, null: false

      t.timestamps
    end
  end
end

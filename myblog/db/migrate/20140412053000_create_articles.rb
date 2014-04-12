class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :content
      t.text :tag
      t.integer :user_id

      t.timestamps
    end
  end
end

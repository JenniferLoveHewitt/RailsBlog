class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string  :category
      t.string  :title
      t.string  :subtitle
      t.string  :content
      t.integer :view_count
      t.integer :rating
      t.timestamps
    end
  end
end

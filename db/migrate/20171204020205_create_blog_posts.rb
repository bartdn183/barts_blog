class CreateBlogPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :entry
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end

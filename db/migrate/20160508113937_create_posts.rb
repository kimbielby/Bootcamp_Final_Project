class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.date :post_date
      t.string :post_content
      t.string :user_id 

      t.timestamps null: false
    end
  end
end

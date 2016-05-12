class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_content
      t.date :comment_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

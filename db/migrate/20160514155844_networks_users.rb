class NetworksUsers < ActiveRecord::Migration
  def change
    create_table :networks_users, :id => false do |t|
      t.integer :network_id, null: false
      t.integer :user_id, null: false
    end
  end
end

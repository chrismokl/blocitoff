class AddLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :user_id
      t.timestamps
    end

    add_column :items, :list_id, :integer
    remove_column :items, :user_id, :integer
  end
end

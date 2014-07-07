class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end

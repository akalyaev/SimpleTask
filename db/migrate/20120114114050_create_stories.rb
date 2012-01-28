class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name, limit: 128, null: false
      t.text :description
      t.integer :status, default: 0 # 0 -new
      t.integer :user_id
      t.integer :points, default: 3
      t.integer :priority, default: 3
      t.boolean :active, default: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.integer :user_id, null: false
      t.boolean :busy, default: false
    end
  end
end

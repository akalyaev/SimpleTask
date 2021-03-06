class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 128, null: false
      t.string :salt, limit: 128, null: false
      t.string :password, limit: 128, null: false
      t.boolean :is_active, default: true
      t.boolean :is_super_admin, default: false

      t.timestamps
    end
  end
end

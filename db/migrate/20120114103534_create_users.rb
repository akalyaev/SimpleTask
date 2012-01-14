class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :salt
      t.string :password
      t.boolean :is_active, default: true
      t.boolean :is_super_admin, default: false

      t.timestamps
    end
  end
end

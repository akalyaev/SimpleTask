class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id, null: true
      t.string :surname, limit: 100, null: true
      t.string :given_names, limit: 100, null: true
      t.integer :gender, default: 0 # 0 - Male, 1 - Female
      t.string :phone, limit: 50
      t.string :mail, limit: 50

      t.timestamps
    end
  end
end

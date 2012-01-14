class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.integer :story_id, null: false
      t.integer :user_id, null: false
      t.text :comment

      t.timestamps
    end
  end
end

class AddFinishedColumn < ActiveRecord::Migration
  def change
    add_column :stories, :finished_at, :datetime
  end
end

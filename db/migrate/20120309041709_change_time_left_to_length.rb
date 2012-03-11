class ChangeTimeLeftToLength < ActiveRecord::Migration
  def up
    rename_column :auctions, :time_left, :length
  end

  def down
    rename_column :auctions, :length, :time_left
  end
end
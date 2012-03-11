class ChangeLengthBack < ActiveRecord::Migration
    def up
      rename_column :auctions, :length, :time_end
    end

    def down
      rename_column :auctions, :time_end, :length
    end
  end
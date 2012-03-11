class ChangeBidsToGems < ActiveRecord::Migration
  def up
    change_column :bids, :amount, :integer
  end

  def down
    change_column :bids, :amount, :decimal
  end
end
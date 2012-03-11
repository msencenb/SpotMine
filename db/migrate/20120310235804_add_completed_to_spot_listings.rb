class AddCompletedToSpotListings < ActiveRecord::Migration
  def change
    change_column :spot_listings, :completed, :bool, :default => false

  end
end
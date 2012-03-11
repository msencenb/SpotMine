class AddBorrowIdAndCompletedToSpotListings < ActiveRecord::Migration
  def change
    add_column :spot_listings, :lender_id, :integer
    add_column :spot_listings, :completed, :boolean
  end
end

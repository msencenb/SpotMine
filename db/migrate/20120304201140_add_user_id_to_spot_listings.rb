class AddUserIdToSpotListings < ActiveRecord::Migration
  def change
    add_column :spot_listings, :user_id, :integer
  end
end

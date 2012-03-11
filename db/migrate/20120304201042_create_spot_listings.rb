class CreateSpotListings < ActiveRecord::Migration
  def change
    create_table :spot_listings do |t|
      t.text :title
      t.text :description
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :auction_id

      t.timestamps
    end
  end
end

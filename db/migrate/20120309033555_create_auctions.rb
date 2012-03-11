class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :user_id
      t.integer :winner_id
      t.text :description
      t.string :title
      t.datetime :time_left

      t.timestamps
    end
  end
end

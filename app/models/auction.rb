class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids
end

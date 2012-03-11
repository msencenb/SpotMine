class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, :on => :create
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :picture, :description
  has_attached_file :picture, :styles => { :medium => "300x300!", :thumb => "90x90!" }, :storage => :s3, :bucket => 'spotmine', :s3_credentials => { :access_key_id => 'AKIAJCFMJMYU4L3MBM5Q', :secret_access_key => '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'}

  has_many :spot_listings
  has_many :auctions
  has_many :bids
end

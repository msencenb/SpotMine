class SpotListingsController < ApplicationController
  # GET /spot_listings
  # GET /spot_listings.json
  def index
    @spot_listings = SpotListing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spot_listings }
    end
  end

  # GET /spot_listings/1
  # GET /spot_listings/1.json
  def show
    @spot_listing = SpotListing.find(params[:id])
    @user = @spot_listing.user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spot_listing }
    end
  end

  # GET /spot_listings/new
  # GET /spot_listings/new.json
  def new
    @spot_listing = SpotListing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spot_listing }
    end
  end

  # GET /spot_listings/1/edit
  def edit
    @spot_listing = SpotListing.find(params[:id])
  end

  # POST /spot_listings
  # POST /spot_listings.json
  def create
    @spot_listing = current_user.spot_listings.build(params[:spot_listing])
    @spot_listing.completed = false
    respond_to do |format|
      if @spot_listing.save
        format.html { redirect_to user_dashboard_url, notice: 'Your listing has been successfully created' }
        format.json { render json: @spot_listing, status: :created, location: @spot_listing }
      else
        format.html { render action: "new" }
        format.json { render json: @spot_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spot_listings/1
  # PUT /spot_listings/1.json
  def update
    @spot_listing = SpotListing.find(params[:id])

    respond_to do |format|
      if @spot_listing.update_attributes(params[:spot_listing])
        format.html { redirect_to @spot_listing, notice: 'Spot listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spot_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_listings/1
  # DELETE /spot_listings/1.json
  def destroy
    @spot_listing = SpotListing.find(params[:id])
    @spot_listing.destroy

    respond_to do |format|
      format.html { redirect_to spot_listings_url }
      format.json { head :no_content }
    end
  end
  
  def open_listings
    @spot_listings= SpotListing.where(:completed => false)
    respond_to do |format|
      format.html
    end
  end
  
  def complete_loan
    @spot_listing = SpotListing.find(params[:id])
    @lender = User.find(params[:lender_id])
    @borrower = @spot_listing.user
    
    @spot_listing.lender_id = @lender.id
    @spot_listing.completed = true
    logger.error @borrower.gem_balance
    logger.error @spot_listing
    @borrower.gem_balance = @borrower.gem_balance - @spot_listing.amount.to_i
    @lender.gem_balance = @lender.gem_balance + @spot_listing.amount.to_i
    respond_to do |format|
      if @spot_listing.save && @borrower.save && @lender.save
        format.html {redirect_to user_dashboard_url, notice: 'Success! Money has been sent and gems added to your account'}
      else
        format.html {redirect_to user_dashboard_url, notice: 'Something went wrong, please contact us at help@spotmine.com'}
      end
    end
  end
end

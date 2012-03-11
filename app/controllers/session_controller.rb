class SessionController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.html { redirect_to user_dashboard_url, :notice => "Logged in!" }
      else
        format.html { render "new" }
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

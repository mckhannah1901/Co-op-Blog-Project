class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user, info: "Log in successful"
    else 
      redirect_to login_path, danger: "Invalid password/email combination"
    end

  end

  def destroy
    log_out
    redirect_to root_url
  end

end

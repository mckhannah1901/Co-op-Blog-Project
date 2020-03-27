class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user, info: 'Log in successful'
    else
      redirect_to login_path, danger: 'Invalid password/email combination'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
    redirect_to root_url, info: 'Logout Successful!'
  end
end

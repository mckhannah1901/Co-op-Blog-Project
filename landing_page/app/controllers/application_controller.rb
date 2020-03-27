class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :danger, :info, :warning, :success

  include SessionsHelper

  rescue_from CanCan::AccessDenied do
    flash[:danger] = 'Access denied!'
    redirect_to login_path
  end

  before_action :set_cache_buster
  def set_cache_buster
    response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
  end
end

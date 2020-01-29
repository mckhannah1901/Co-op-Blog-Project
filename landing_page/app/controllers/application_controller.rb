class ApplicationController < ActionController::Base

   protect_from_forgery with: :exception

   add_flash_types :danger, :info, :warning, :success

   include SessionsHelper

end

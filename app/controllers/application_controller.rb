class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_location

  private

  def current_location
  	Location.find_by(zipcode: session[:zipcode])
  end
end

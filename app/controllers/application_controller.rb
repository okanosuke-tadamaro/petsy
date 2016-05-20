class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_location, :breeds_list

  private

  def logged_in?
    session[:email].present?
  end

  def current_user
  	User.find_by(email: session[:email])
  end

  def breeds_list
    Breed.all.map { |breed| [breed.breed, breed.id] }
  end

end

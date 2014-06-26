class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  private

  def authenticate_user!
    if current_user.nil?
      redirect_to '/auth/crystal_commerce'
    elsif !current_user.crystalcommerce_email?
      render file: 'public/403.html', status: 403, layout: false
    end
  end

  def current_user
    if session[:current_user]
      @current_user ||= User.new(session[:current_user])
    end
  end
end

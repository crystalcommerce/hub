class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
    redirect_to '/auth/crystal_commerce'
  end

  def create
    auth_info = request.env["omniauth.auth"].fetch("info")
    user = User.new(auth_info)

    if user
      # Reset the session after successful login, per
      # 2.8 Session Fixation – Countermeasures:
      # http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
      reset_session
      session[:current_user] = auth_info

      redirect_to root_url, :notice => 'Signed in!'
    else
      new
    end
  end

  def destroy
    reset_session
    redirect_to "https://accounts.crystalcommerce.com/users/sign_out?redirect_uri=#{login_url}"
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :user_signed_in?, :correct_user?

  private
  def current_user
  	begin
  		@current_user ||= User.where(uid: session[:user_id]).first
  	rescue Mongoid::Errors::DocumentNotFound
  		nil
  	end
  end

  def user_signed_in?
  	return true if current_user
  end

  def correct_user?
  	@user= User.find(params[:id])
  	unless current_user == @user
  		redirect_to root_url,alert: "拒绝访问！"
  	end
  end

  def autenticate_user!
  	if !current_user
    	redirect_to root_url,alert: "你需要登录才能浏览！"
  	end
  end
end

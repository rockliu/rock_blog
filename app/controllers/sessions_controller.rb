class SessionsController < ApplicationController
	def new
		redirect_to '/auth/github'
	end

	def create
		auth = request.env['omniauth.auth']
		user = User.where(provider: auth['provider'],uid: auth['uid']).first || User.create_with_omniauth(auth)
		session[:user_id] = user.uid
		redirect_to root_url, notice: "已登入！"
	end

	def destroy
		reset_session
		redirect_to root_url, notice: "已注销！"
	end

	def failure
		redirect_to root_url, alert: "验证错误: #{params[:message].humanize}！"
	end
end

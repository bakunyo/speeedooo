# encoding: utf-8

class SessionsController < ApplicationController
	def callback
	
		auth = request.env["omniauth.auth"]
		
		#User���f��������
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
		
		if user
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in"
		else
			User.create_with_omniauth(auth)
			redirect_to root_url, :notice => "#{auth["info"]["name"]}s#{auth["provider"]}account is connected."
		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out"
	end
	
end

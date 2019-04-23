module Api
	class SessionsController < ApplicationController

		def create
			user = User.find_by_email(params[:email])
			if user&.valid_password?(params[:password])
				user.save
				render json: user.as_json(only: [:email, :authentication_token]), status: :created
			else
			 	head(:unauthorized)
			end
		end

		def destroy
			
		end
	end
end
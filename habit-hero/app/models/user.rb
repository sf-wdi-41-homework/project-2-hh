class User < ApplicationRecord
	has_secure_password
	has_many :habits
		def self.confirm(params)
    	@user = User.find_by({username: params[:username]})
    	@user ? @user.authenticate(params[:password]) : false
	end 
end

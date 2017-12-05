class User < ApplicationRecord
	validates :password, presence: true, length: {minimum: 8}
	validates :username, presence: true, uniqueness: true
	has_secure_password
	# TODO: Use join table, has_many, through?
	# has_many :habits, through: :user_habits
	has_many :habits, dependent: :destroy
	has_many :logged_habits, dependent: :destroy

	# TODO: Why class method instead of instance?
	def self.confirm(params)
  	@user = User.find_by({username: params[:username]})
  	@user ? @user.authenticate(params[:password]) : false
	end
end

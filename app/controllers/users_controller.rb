class UsersController < ApplicationController
	include SessionsHelper

	def show
		@user = current_user
	end
end
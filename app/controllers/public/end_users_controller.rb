class Public::EndUsersController < ApplicationController
	def top
	end
	def show
		@end_user = EndUser.find(params[:id])
	end

end

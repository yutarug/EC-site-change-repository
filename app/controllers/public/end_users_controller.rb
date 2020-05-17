class Public::EndUsersController < ApplicationController
	def top
	end
	def confirm
		@end_user = current_end_user
	end
	def show
		@end_user = current_end_user
	end
	def edit
		@end_user = current_end_user
	end
	def update
		@end_user = current_end_user
		@end_user.update(end_user_params)
		redirect_to public_end_user_path
	end
	def destroy
		end_user = current_end_user
		end_user.is_deleted = true
		end_user.update(is_deleted:true)
		end_user.destroy
		redirect_to public_root_path
	end

	private
	def end_user_params
  		params.require(:end_user).permit(:first_name, :second_name, :first_name_kana, :second_name_kana, :postal_code, :street_address, :phone_number)
  	end


end

class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
   protect_from_forgery with: :exception
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :second_name, :first_name_kana, :second_name_kana,
                                      :postal_code, :street_address, :phone_number])
  end


   def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
          admin_top_path
      elsif resource.is_a?(EndUser)
          public_end_user_path(current_end_user.id)
      end
     # if resource == Admin
        #admin_top_path
      #elsif resource == EndUser
      #~~~
      #end
   end



   #元に戻す
   def after_sign_out_path_for(resource)
        if resource == :admin
          new_admin_session_path
        elsif resource == :end_user
          public_root_path
        end # ログアウト後に遷移するpathを設定
   end

    #デバッグ用
end

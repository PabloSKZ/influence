class RegistrationsController < Devise::RegistrationsController
    protected
  
    def sign_up_params
        params.require(:user).permit(:email, :password, :city_id, :first_name, :last_name, :user_type)
    end

    def after_sign_up_path_for(resource)
        if current_user.user_type == 'influencer'
            new_project_path
        elsif current_user.user_type == 'freelance'
            new_advert_path
        end
    end
  end
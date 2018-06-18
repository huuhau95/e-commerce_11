class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  before_action :load_menu

  def create
    @user = User.new params_user
    if @user.save
      sign_in @user
      set_flash_message(:notice, :signed_up) if is_flashing_format?
      redirect_to after_sign_in_path_for @user
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit :email, :name, :password, :password_confirmation
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :image)
  end
end

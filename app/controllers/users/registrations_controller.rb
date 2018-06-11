class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new params_user
    if @user.save
      sign_in @user
      redirect_to after_sign_in_path_for(@user)
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit :email, :name, :password, :password_confirmation, :image
  end
end

class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :load_menu, :correct_user

  def new
    @user = User.new
  end

  def create
    @user = User.new params_user
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes params_user
      flash[:success] = t "update_user_sucess"
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def correct_user
    @user = User.find_by_id params[:id]
    redirect_to root_url unless current_user.current_user? @user
  end

  def params_user
    params.require(:user).permit :email, :name, :password, :password_confirmation, :image
  end
end

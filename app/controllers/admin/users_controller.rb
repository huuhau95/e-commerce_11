class Admin::UsersController < Admin::BaseController
  before_action :logged_in_user
  before_action :load_user, only: %i(show edit update destroy)
<<<<<<< 086d526406dbabc07cfd9a711e7dd13f8466571d

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).all.page(params[:page]).per Settings.settings.per_page
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t "create_success"
      redirect_to admin_users_url
    else
      render :new
    end
  end

  def edit; end

=======

  def index
    @users = User.user_info.page(params[:page]).per Settings.settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:info] = t "create_success"
      redirect_to admin_users_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

>>>>>>> view users
  def update
    if @user.update user_params
      flash[:success] = t "profile_updated"
      redirect_to admin_users_url
    else
      render :edit
    end
  end

<<<<<<< 086d526406dbabc07cfd9a711e7dd13f8466571d
  def destroy
    @user.destroy
    flash[:success] = t "delete_success"
    redirect_to admin_users_url
  end
=======
  def destroy; end
>>>>>>> view users

  private

  def user_params
<<<<<<< 086d526406dbabc07cfd9a711e7dd13f8466571d
    params[:user][:role] = params[:user][:role].to_i
    params.require(:user).permit :name, :email, :image, :password, :role, :password_confirmation
=======
    params.require(:user).permit :name, :email, :password, :images, :role,
      :password_confirmation
>>>>>>> view users
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to admin_users_url
  end
end

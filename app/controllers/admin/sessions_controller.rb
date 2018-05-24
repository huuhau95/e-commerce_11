class Admin::SessionsController < Admin::BaseController
  layout "admin/layouts/application"
  def new_admin
    return unless logged_in_admin?
    flash[:info] = t "logged_in"
    redirect_to admin_root_url
  end

  def create_admin
    admin = User.find_by email: params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password]) && admin.role == Settings.setting_model.role_admin
      log_in_admin admin
      redirect_back_or admin_root_url
    else
      flash.now[:danger] = t "invalid"
      render :new_admin
    end
  end

  def destroy_admin
    log_out_admin if logged_in_admin?
    redirect_to admin_root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_root_url
  end
end

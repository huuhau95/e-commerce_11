class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin/layouts/admin"
  include SessionsHelper1

  def logged_in_user
    return if logged_in_admin?
    store_location
    flash[:danger] = t "please_login"
    redirect_to admin_login_path
  end

  def set_search_category
    @search = Category.search(params[:q])
  end
end

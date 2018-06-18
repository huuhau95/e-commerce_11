module SessionsHelper1
  def log_in_admin admin
    session[:admin_id] = admin.id
  end

  def current_admin? admin
    admin == current_admin
  end

  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= User.find_by id: admin_id
    elsif (admin_id = cookies.signed[:admin_id])
      admin = User.find_by id: admin_id
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  def remember_admin admin
    admin.remember_admin
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def logged_in_admin?
    current_admin ? true : false
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  def redirect_back_or default
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end

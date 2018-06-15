class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper
  before_action :session_cart

  def load_menu
    @categories = Category.display
    @categories_option = Category.all.where(status: true).map{|c| [c.name, c.id]}
  end

  def require_login
    return if logged_in?
    flash[:danger] = t "please_login"
    redirect_to login_path
  end

  def session_cart
    @cart = session[:cart] || {}
    @count_product_cart = 0
    unless @cart.empty?
      @products_cart = @cart.map {|id, quantity| [Product.find_by(id: id), quantity]}
      @count_product_cart = @cart.length
      @total = total_cart @products_cart
    else
      @count_product_cart = 0
    end
  end

  def set_search_product
    @search = Product.search(params[:q])
  end
end

class CartsController < ApplicationController
  before_action :product_params_id, :load_menu,:set_search_product
  before_action :cart_user, only: :index

  def index; end

  def add_to_cart
    respond_to do |format|
      session[:cart] = {} unless session[:cart]
      cart = session[:cart]
      cart[@id] = cart[@id] ? (cart[@id].to_i + 1) : 1
      session_cart
      @mess = t "success_add_cart"
      format.js {render "carts.js.erb"}
    end
  end

  def destroy
    respond_to do |format|
      cart = session[:cart]
      cart.delete(@id)
      session_cart
      @mess = t "success_delete_cart"
      format.js {render "carts.js.erb"}
    end
  end

  def update
    respond_to do |format|
      cart = session[:cart]
      cart[@id] = params[:quantity].to_i
      session_cart
      @mess = t "success_update_cart"
      format.js {render "carts.js.erb"}
    end
  end

  private

  def cart_user
    if session[:cart].empty?
      flash[:danger] = t :empty_cart
      redirect_to root_path
    end
  end

  def product_params_id
    @id = params[:id]
    @product = Product.find_by @id
    return if @product
    flash[:danger] = t :not_found_product
    redirect_to root_path
  end
end

class CartsController < ApplicationController
  before_action :load_product, :load_menu, :set_search
  before_action :check_cart_existence, only: [:index]

  def index; end

  def add_to_cart
    respond_to do |format|
      session[:cart] = {} unless session[:cart]
      cart = session[:cart]
      cart[@id] = cart[@id] ? (cart[@id].to_i + 1) : 1
      session_cart
      flash[:notice] = t "success_add_cart"
      format.js {render "carts.js.erb"}
    end
  end

  def destroy
    respond_to do |format|
      cart = session[:cart]
      cart.delete(@id)
      session_cart
      flash[:notice] = t "success_delete_cart"
    end
  end

  def update
    respond_to do |format|
      cart = session[:cart]
      cart[@id] = params[:quantity].to_i
      session_cart
      flash[:notice] = t "success_update_cart"
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

  def check_cart_existence
    if session[:cart].empty?
      flash[:danger] = t :empty_cart
      redirect_to root_path
    end
  end

  def load_product
    @id = params[:id]
    @product = Product.find_by @id
    return if @product
    flash[:danger] = t :not_found_product
    redirect_to root_path
  end
end

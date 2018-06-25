class OrdersController < ApplicationController
  before_action :load_menu, :cart_user, :authenticate_user!, :set_search_product

  def new
    @order = current_user.orders.new
  end

  def create
  	@order = current_user.orders.new user_params

    @order.transaction do
      if @order.save
        @quantity_product.each do |product, quantity|
          @order_detail = @order.order_details.new quantity: quantity,
            product_id: product.id, price: product.price
          @order_detail.transaction do
            raise t "error_order" unless @order_detail.save
          end
        end
        session[:cart] = nil
        OrderMailer.order_mail(current_user, @order, @quantity_product).deliver_now
        flash[:success] = t "success_order"
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def cart_user
  	@cart = session[:cart] ? session[:cart] : Hash.new
    @quantity_product = @cart.map {|id, quantity| [Product.find_by(id: id), quantity]}

    if session[:cart].blank?
      flash[:danger] = t :need_login_checkout
      redirect_to root_url
    end
  end

  def user_params
  	params.require(:order).permit :address, :phone
  end
end

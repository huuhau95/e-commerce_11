class HistoriesController < ApplicationController
  before_action :load_menu, :correct_user, :set_search
  before_action :find_params_id, only: :show
  before_action :check_view, only: :show

  def index
  	@history = current_user.orders
  end

  def show
  	@order_detail = @order.order_details
  end

  private

  def find_params_id
  	@order = Order.find_by_id params[:id]
  	return if @order
  	  flash[:danger] = t "cannot_find_order"
  	  redirect_to root_url
  end

  def check_view
    redirect_to root_url unless current_user.id == @order.user_id
  end

  def correct_user
  	redirect_to root_url unless logged_in?
  end
end

class HistoriesController < ApplicationController
  before_action :load_menu, :correct_user, :set_search_product, :set_search_order_history
  before_action :find_params_id, only: :show
  before_action :check_view, only: :show

  def index
  	@history = @search_order.result(distinct: true).all.page(params[:page]).per Settings.settings.per_page
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
  	redirect_to root_url unless user_signed_in?
  end

  def set_search_order_history
    @search_order = current_user.orders.search(params[:q])
  end
end

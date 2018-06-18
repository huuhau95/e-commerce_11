class Admin::StaticPagesController < Admin::BaseController
  before_action :logged_in_user

  def home
    @total_orders = Order.count('id')
    @total_revenue = OrderDetail.sum('price*quantity')
    @total_member = User.count('id');
    @total_order_this_day = OrderDetail.statistic_this_day
    @total_order_of_user = User.joins(:orders).group(:user_id,:name).sum(:id)
  end
end

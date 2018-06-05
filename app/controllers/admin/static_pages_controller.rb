class Admin::StaticPagesController < Admin::BaseController
  before_action :logged_in_user

  def home
    @total_orders = Order.count('id')
    # @total_revenue = OrderDetail.sum(price*quantity)
    @total_member = User.count('id');
  end
end

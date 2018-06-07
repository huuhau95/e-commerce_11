class StaticPagesController < ApplicationController
  before_action :load_menu, only: :home

  def home
    @q = Product.ransack params[:q]
    @products = @q.result(distinct: true).all.order_product.page(params[:page]).per Settings.settings.limit_product
  end

end

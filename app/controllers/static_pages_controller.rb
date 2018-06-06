class StaticPagesController < ApplicationController
  before_action :load_menu, :set_search_product, :load_menu, only: [:home, :index]

  def home
    @products = Product.all.order_product.status_true.page(params[:page]).per Settings.settings.limit_product
  end

  def index
    @products = @search.result(distinct: true).all.order_product.status_true.page(params[:page]).per Settings.settings.per_page
    return if @products
    flash[:danger] = t "product_not_found"
    redirect_to root_url
  end
end

class StaticPagesController < ApplicationController
  before_action :load_menu, :set_search, only: [:home, :index]

  def home
    @products = Product.filter_by_less_price(params[:less_price]).filter_by_higher_price(params[:higher_price]).filter_by_category(params[:category_id]).search_by_name(params[:search]).order_product.limit Settings.settings.limit_product
  end

  def index
    @products = @search.result(distinct: true).all.order_product.page(params[:page]).per Settings.settings.per_page
  end
end

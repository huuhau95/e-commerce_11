class StaticPagesController < ApplicationController
  before_action :load_menu, :set_search, only: [:home, :index]

  def home
    @products = Product.order_product.limit Settings.settings.limit_product
  end

  def index
    @products = @search.result(distinct: true).all.order_product.page(params[:page]).per Settings.settings.per_page
  end
end

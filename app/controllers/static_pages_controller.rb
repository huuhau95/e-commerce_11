class StaticPagesController < ApplicationController
  before_action :load_menu, :set_search, only: [:home, :index]

  def home
    @products = Product.order_product.limit Settings.settings.limit_product
  end
<<<<<<< 745e0ff5bfe486dcdd04a98b23ff4e3b04273480

  def index
    @products = @search.result(distinct: true).all.order_product.page(params[:page]).per Settings.settings.per_page
  end
=======
  def home; end
>>>>>>> static_pages
end

class Admin::ProductsController < Admin::BaseController
  before_action :logged_in_user
  before_action :load_product, except: %i(index new create)
  before_action :map_category, only: :index

  def index
    @products = Product.ordered.filter_by_category(params[:category_id]).filter_by_status(params[:status]).search_by_name(params[:search]).page(params[:page]).per Settings.settings.per_page
    if params[:category_id].present? || params[:status].present? || params[:search].present?
      flash.now[:success] = t "search_success"
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create product_pamrams
    if @product.save
      flash[:success] = t "create_success"
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update_attributes product_pamrams
      flash[:success] = t "update_success"
      redirect_to admin_products_url
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "delete_success"
    else
      flash[:errors] = t "delete_fail"
    end
    redirect_to admin_products_url
  end

  private

  def product_pamrams
    params[:product][:status] = params[:product][:status].to_i
    params.require(:product).permit :category_id, :name, :price, :new_price,
      :quantity, :status, :description, :discount,
        images_attributes: [:id, :image_url, :_destroy]
  end

  def load_product
      @product = Product.find_by id: params[:id]
      return if @product
      flash[:danger] = t "product_not_found"
      redirect_to admin_products_url
  end

  def map_category
    @categories = Category.all.map{|c| [c.name, c.id]}
    @categories_option = Product.all.map{|c| [c.status, c.id]}.uniq
  end
end

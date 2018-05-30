module Admin
  class ProductsController < BaseController
    before_action :logged_in_user
    before_action :load_product, except: %i(index new create)

    def index
      @products = Product.paginate page: params[:page], per_page: Settings.setting_model.page_size
    end

    def show; end

    def edit; end

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

    def update
      if @product.update product_pamrams
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

    def load_product
        @product = Product.find_by id: params[:id]
        return if @product
        flash[:danger] = t "product_not_found"
        redirect_to admin_products_url
    end

    def product_pamrams
      params.require(:product).permit :category_id, :name, :price, :new_price,
        :quantity, :status, :description, :images, :discount
    end
  end
end

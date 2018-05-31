class Admin::CommentsController < Admin::BaseController
  before_action :logged_in_user
  before_action :load_order, except: %i(index new create)
  def index
    @comments = Comment.paginate page: params[:page],
      per_page: Settings.setting_model.page_size
  end

  def show; end

  def edit; end

  def new; end

  def create; end

  def update; end

  def destroy
    if @comments.destroy
      flash[:success] = t "delete_success"
    else
      flash[:errors] = t "delete_fail"
    end
    redirect_to admin_comments_url
  end

  private

  def load_order
      @comments = Comment.find_by id: params[:id]
      return if @comments
      flash[:danger] = t "order_not_found"
      redirect_to admin_comments_url
  end
end

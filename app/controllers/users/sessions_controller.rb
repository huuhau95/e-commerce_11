class Users::SessionsController < Devise::SessionsController
  include ApplicationHelper
  before_action :load_menu, :set_search_product

  def new
    super
  end
end

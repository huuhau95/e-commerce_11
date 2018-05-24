class OrderMailer < ApplicationMailer
  add_template_helper ApplicationHelper

  def order_mail user, order, product
    @user = user
    @order = order
    @product = product
    mail to: user.email, subject: t("info_order")
  end
end

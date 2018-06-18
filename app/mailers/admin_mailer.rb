class AdminMailer < ApplicationMailer

  def send_mail_statistic
    User.admins(1).each do |admin|
      self.load_statistic(admin).deliver
    end
  end

  def load_statistic admin
    @total_price = Product.total_this_month :price
    @total_quantity = Product.total_this_month :quantity
    @total_order = Order.all
    @admin = admin
    mail to: @admin.email, subject: t("Monthly_statistic")
  end
end

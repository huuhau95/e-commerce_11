task send_mail_statistic: :environment do
  AdminMailer.send_mail_statistic.deliver
end

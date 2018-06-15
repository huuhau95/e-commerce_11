set :environment, "development"

every 1.month do
  rake "send_mail_statistic"
end

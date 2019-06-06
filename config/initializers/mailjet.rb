Mailjet.configure do |config|
  config.api_key = ENV['MAIL_JET_LOGIN']
  config.secret_key = ENV['MAIL_JET_PWD']
  config.default_from = ENV['MAIL_JET_DEFAULT_FROM']
end

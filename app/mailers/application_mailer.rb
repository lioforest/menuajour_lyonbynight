class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_JET_DEFAULT_FROM']
  layout 'mailer'
end

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#ActionMailer::Base.smtp_settings = {
 # :user_name => ENV['MAILJET_LOGIN'],
 # :password => ENV['MAILJET_PWD'],
 # :domain => 'side-events.herokuapp.com',
 # :address => 'in-v3.mailjet.com',
 # :port => 587,
 # :authentication => :plain,
#}

ActionMailer::Base.smtp_settings =   {
    :address            => 'in-v3.mailjet.com',
    :port               => 587,
    :domain             => 'herokuapp.com',
    :authentication     => :plain,
    :user_name          => ENV['MAILJET_LOGIN'],
    :password           => ENV['MAILJET_PWD'],
    :from               => ENV['MAIL'],
    :enable_starttls_auto => true
  }
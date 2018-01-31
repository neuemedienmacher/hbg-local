require 'localeapp/rails'

Localeapp.configure do |config|
  if ENV['LOCALEAPP_KEY']
    config.api_key = ENV['LOCALEAPP_KEY']
    config.polling_environments = [:development]
    config.sending_environments = []
  else
    config.api_key = 'none'
    config.polling_environments = []
    config.sending_environments = []
  end
end

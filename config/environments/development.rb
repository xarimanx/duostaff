Duostaff::Application.configure do
  config.cache_classes = false
  config.cache_store = :mem_cache_store

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.action_mailer.default_url_options = { :host => "localhost" }

  config.assets.compress = false
  config.assets.compile = true

  config.assets.debug = true
  config.eager_load = false

  SEND_NEWS_LETTER = false

  # Constants for mailers
  BASE_URL = "localhost"
  BASE_PORT = 3000
  WEBSITE_URL                    = "#{BASE_URL}#{BASE_PORT}"


  config.action_mailer.delivery_method     = :sendmail
  config.action_mailer.default_url_options = { :host => BASE_URL, :port => BASE_PORT }
end

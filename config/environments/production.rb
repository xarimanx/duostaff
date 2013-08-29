Duostaff::Application.configure do
  config.cache_classes = true
  config.cache_store = :mem_cache_store

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :sendmail
  config.active_support.deprecation = :log

  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.eager_load = true
  # Constants for mailers
  WEBSITE_URL                    = 'duostaff.dn.ua'

  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  config.serve_static_assets = true
  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify
end

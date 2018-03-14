Rails.application.configure do
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_controller.perform_caching = false
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.migration_error = :page_load
  config.active_support.deprecation = :log
  config.assets.debug = false
  config.assets.quiet = true
end

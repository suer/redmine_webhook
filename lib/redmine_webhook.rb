unless Rails.try(:autoloaders).try(:zeitwerk_enabled?)
  require 'redmine_webhook/projects_helper_patch'
  require 'redmine_webhook/issue_wrapper'
  require 'redmine_webhook/webhook_listener'
end

module RedmineWebhook
end

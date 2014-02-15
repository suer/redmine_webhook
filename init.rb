require 'redmine_webhook'

Rails.configuration.to_prepare do
  unless ProjectsHelper.included_modules.include? RedmineWebhook::ProjectsHelperPatch
    ProjectsHelper.send(:include, RedmineWebhook::ProjectsHelperPatch)
  end
end

Redmine::Plugin.register :redmine_webhook do
  name 'Redmine Webhook plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

require_dependency 'redmine_webhook'

Rails.configuration.to_prepare do
  unless ProjectsHelper.included_modules.include? RedmineWebhook::ProjectsHelperPatch
    ProjectsHelper.send(:include, RedmineWebhook::ProjectsHelperPatch)
  end
end

Redmine::Plugin.register :redmine_webhook do
  name 'Redmine Webhook plugin'
  author 'suer'
  description 'A Redmine plugin posts webhook on creating and updating tickets'
  version '0.0.2'
  url 'https://github.com/suer/redmine_webhook'
  author_url 'http://d.hatena.ne.jp/suer'
  permission :manage_hook, {:webhook_settings => [:show,:update,:create, :destroy]}, :require => :member
end

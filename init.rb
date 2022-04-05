if Rails.try(:autoloaders).try(:zeitwerk_enabled?)
  Rails.autoloaders.main.push_dir File.dirname(__FILE__) + '/lib/redmine_webhook'
  RedmineWebhook::ProjectsHelperPatch
  RedmineWebhook::WebhookListener
else
  require "redmine_webhook"
end

Redmine::Plugin.register :redmine_webhook do
  name 'Redmine Webhook plugin'
  author 'suer'
  description 'A Redmine plugin posts webhook on creating and updating tickets'
  version '0.0.5'
  url 'https://github.com/suer/redmine_webhook'
  author_url 'http://d.hatena.ne.jp/suer'
  project_module :webhooks do
    permission :manage_hook, {:webhook_settings => [:index, :show, :update, :create, :destroy]}, :require => :member
  end
end

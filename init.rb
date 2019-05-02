require 'redmine_webhook'

Redmine::Plugin.register :redmine_webhook do
  name 'Redmine Webhook plugin'
  author 'suer'
  description 'A Redmine plugin posts webhook on creating and updating tickets'
  version '0.0.4'
  url 'https://github.com/suer/redmine_webhook'
  author_url 'http://d.hatena.ne.jp/suer'
  permission :manage_hook, {:webhook_settings => [:index, :show, :update, :create, :destroy]}, :require => :member
end

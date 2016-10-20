get 'projects/:id/webhook_settings/show', :controller => 'webhook_settings', :action => 'show', :as => :show_webhook_settings
post 'projects/:id/webhook_settings/create', :controller => 'webhook_settings', :action => 'create', :as => :create_webhook
put 'projects/:id/webhook_settings/:webhook_id', :controller => 'webhook_settings', :action => 'update', :as => :update_webhook
delete 'projects/:id/webhook_settings/:webhook_id', :controller => 'webhook_settings', :action => 'destroy', :as => :delete_webhook
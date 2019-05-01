module RedmineWebhook
  module ProjectsHelperPatch
    def project_settings_tabs
      tabs = super
      tabs << {
        :name => 'webhook',
        :controller => 'webhook_settings',
        :action => :show,
        :partial => 'webhook_settings/show',
        :label => :webhook
      }
    end
  end

  ProjectsHelper.prepend ProjectsHelperPatch
end

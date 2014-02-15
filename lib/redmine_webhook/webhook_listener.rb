class RedmineWebhook::WebhookListener < Redmine::Hook::Listener
  def controller_issues_new_after_save(context = {})
    issue = context[:issue]
    project = issue.project
    webhook = Webhook.where(:project_id => project.project.id).first
    return unless webhook
    post(webhook, issue_create_payload(issue))
  end

  private
  def issue_create_payload(issue)
    {:payload => issue}.to_json(issues_to_json_option)
  end

  def issues_to_json_option
    {
      :include => [
        {:project => {:only => [:id, :identifier, :name, :description, :homepage, :created_on, :updated_at]}},
        {:status => {:only => [:id, :name]}},
        {:tracker => {:only => [:id, :name]}},
        {:priority => {:only => [:id, :name]}},
        {:author => {:only => [:login, :mail, :firstname, :lastname, :identity_url]}},
        {:assigned_to => {:only => [:login, :mail, :firstname, :lastname, :identity_url]}}
      ]
    }
  end

  def post(webhook, request_body)
    Thread.start do
      begin
        Faraday.post do |req|
          req.url webhook.url
          req.headers['Content-Type'] = 'application/json'
          req.body = request_body
        end
      rescue => e
        Rails.logger.error e
      end
    end
  end
end

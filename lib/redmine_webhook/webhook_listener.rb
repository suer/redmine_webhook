class RedmineWebhook::WebhookListener < Redmine::Hook::Listener
  def controller_issues_new_after_save(context = {})
    issue = context[:issue]
    project = issue.project
    webhook = Webhook.where(:project_id => project.project.id).first
    return unless webhook
    post(webhook, issue_to_json(issue))
  end

  def controller_issues_edit_after_save(context = {})
    journal = context[:journal]
    journal.issue = context[:issue]
    project = journal.issue.project
    webhook = Webhook.where(:project_id => project.project.id).first
    return unless webhook
    post(webhook, journal_create_payload(journal))
  end

  private
  def issue_to_json(issue)
    {
      :payload => {
        :action => 'opened',
        :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash
      }
    }.to_json
  end

  def journal_create_payload(journal)
    {:payload => journal}.to_json(journal_to_json_option)
  end

  def journal_to_json_option
    {
      :include => {
        :user => {:only => [:login, :mail, :firstname, :lastname, :identity_url]},
        :issue => issues_to_json_option,
        :details => {:only => [:id, :value, :old_value, :prop_key, :property]}
      }
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

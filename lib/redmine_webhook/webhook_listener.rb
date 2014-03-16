class RedmineWebhook::WebhookListener < Redmine::Hook::Listener

  def controller_issues_new_after_save(context = {})
    issue = context[:issue]
    controller = context[:controller]
    project = issue.project
    webhook = Webhook.where(:project_id => project.project.id).first
    return unless webhook
    post(webhook, issue_to_json(issue, controller))
  end

  def controller_issues_edit_after_save(context = {})
    journal = context[:journal]
    controller = context[:controller]
    issue = context[:issue]
    project = issue.project
    webhook = Webhook.where(:project_id => project.project.id).first
    return unless webhook
    post(webhook, journal_to_json(issue, journal, controller))
  end

  private
  def issue_to_json(issue, controller)
    {
      :payload => {
        :action => 'opened',
        :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash,
        :url => controller.issue_url(issue)
      }
    }.to_json
  end

  def journal_to_json(issue, journal, controller)
    {
      :payload => {
        :action => 'updated',
        :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash,
        :journal => RedmineWebhook::JournalWrapper.new(journal).to_hash,
        :url => controller.issue_url(issue)
      }
    }.to_json
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

class RedmineWebhook::IssueWrapper
  def initialize(issue)
    @issue = issue
  end

  def to_json
    {
      :action => "create",
      :issue => {
        :id => @issue.id,
        :subject => @issue.subject,
        :description => @issue.description,
        :created_on => @issue.created_on,
        :updated_on => @issue.updated_on,
        :closed_on => @issue.closed_on,
        :root_id => @issue.root_id,
        :parent_id => @issue.parent_id,
        :done_ratio => @issue.done_ratio,
        :start_date => @issue.start_date,
        :due_date => @issue.due_date,
        :estimated_hours => @issue.estimated_hours,
        :is_private => @issue.is_private,
        :lock_version => @issue.lock_version
      }
    }.to_json
  end
end

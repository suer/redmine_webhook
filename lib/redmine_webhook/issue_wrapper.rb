class RedmineWebhook::IssueWrapper
  def initialize(issue)
    @issue = issue
  end

  def to_hash
    {
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
      :lock_version => @issue.lock_version,
      :project => RedmineWebhook::ProjectWrapper.new(@issue.project).to_hash,
      :status => RedmineWebhook::StatusWrapper.new(@issue.status).to_hash,
      :tracker => RedmineWebhook::TrackerWrapper.new(@issue.tracker).to_hash,
      :priority => RedmineWebhook::PriorityWrapper.new(@issue.priority).to_hash,
      :author => RedmineWebhook::AuthorWrapper.new(@issue.author).to_hash,
      :assignee => RedmineWebhook::AuthorWrapper.new(@issue.assigned_to).to_hash,
      :watchers => @issue.watcher_users.collect{|u| RedmineWebhook::AuthorWrapper.new(u).to_hash}
    }
  end
end

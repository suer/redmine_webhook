class RedmineWebhook::StatusWrapper
  def initialize(status)
    @status = status
  end

  def to_hash
    {
      :id => @status.id,
      :name => @status.name
    }
  end
end

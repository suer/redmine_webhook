class RedmineWebhook::AuthorWrapper
  def initialize(author)
    @author = author
  end

  def to_hash
    {
      :id => @author.id,
      :login => @author.login,
      :mail => @author.mail,
      :firstname => @author.firstname,
      :lastname => @author.lastname,
      :identity_url => @author.identity_url,
    }
  end
end

module RedmineWebhook
  class JournalWrapper
    def initialize(journal)
      @journal = journal
    end

    def to_hash
      {
        :id => @journal.id,
        :notes => @journal.notes,
        :created_on => @journal.created_on,
        :private_notes => @journal.private_notes,
        :author => RedmineWebhook::AuthorWrapper.new(@journal.user).to_hash,
        :details => @journal.details.map {|detail| RedmineWebhook::JournalDetailWrapper.new(detail).to_hash }
      }
    end
  end
end

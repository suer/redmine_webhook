class RedmineWebhook::CustomFieldWrapper
  def initialize(custom_field)
    @custom_field = custom_field
  end

  def to_hash
    {
        id: @custom_field.id,
        name: @custom_field.name,
        possible_values: @custom_field.possible_values
    }
  end
end

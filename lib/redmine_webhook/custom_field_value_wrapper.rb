class RedmineWebhook::CustomFieldValueWrapper
  def initialize(custom_field_value)
    @custom_field_value = custom_field_value
  end

  def to_hash
    {
        custom_field_id: @custom_field_value.custom_field_id,
        custom_field_name: @custom_field_value.custom_field.name,
        value: @custom_field_value.value
    }
  end
end

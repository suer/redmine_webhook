class AddWebhookSecretKey < ActiveRecord::Migration[4.2]
    def change
      add_column :webhooks, :secret_key, :text
    end
  end
File.open(Rails.root.join('app',
                          'controllers',
                          'mail_handler_controller.rb'), 'r+') do |file|
  text = file.read
  path = 'plugins/redmine_webhooks/lib/redmine_webhooks/fix_mail_handler.rb'
  unless text.include?(path)
    file.rewind
    file.write(text.sub(/(\s*)(?=(?>def\s+index))/, '\1# This method is redefined in ' << path << '\1'))
  end
end

MailHandlerController.redefine_method :index do
  options = params.dup
  email = options.delete(:email)
  if object = MailHandler.receive(email, options)
    listeners = Redmine::Hook.listeners.select do |obj|
      obj.instance_of? RedmineWebhook::WebhookListener
    end

    case object
    when Issue
      listeners.each do |listener|
        listener.controller_issues_new_after_save({
          :issue => object, :controller => self
        })
      end
    when Journal
      listeners.each do |listener|
        listener.controller_issues_edit_after_save({
          :issue => object.issue, :controller => self, :journal => object
        })
      end
    end
    head :created
  else
    head :unprocessable_entity
  end
end

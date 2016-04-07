class WebhookSettingsController < ApplicationController
  before_filter :find_project, :authorize
  
  def update
    webhook = Webhook.where(:project_id => @project.id).first_or_create
    webhook.url = params[:url]
    if webhook.save
      flash[:notice] = l(:notice_successful_update)
    else
      flash[:error] = l(:notice_fail_to_save_settings)
    end
    redirect_to settings_project_path(@project, :tab => 'webhook')
  end
end

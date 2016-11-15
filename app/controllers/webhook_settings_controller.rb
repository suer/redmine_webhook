class WebhookSettingsController < ApplicationController
  before_filter :find_project, :authorize
  
  def create
    webhook = Webhook.new(:project_id => @project.id)
    webhook.url = params[:url]
    if webhook.save
      flash[:notice] = l(:notice_successful_create_webhook)
    else
      flash[:error] = l(:notice_fail_create_webhook)
    end
    redirect_to settings_project_path(@project, :tab => 'webhook')
  end
  def update
    id = params[:webhook_id]
    webhook = Webhook.where(:project_id => @project.id).where(:id => id).first
    webhook.url = params[:url]
    if webhook.save
      flash[:notice] = l(:notice_successful_update_webhook)
    else
      flash[:error] = l(:notice_fail_update_webhook)
    end
    redirect_to settings_project_path(@project, :tab => 'webhook')
  end
  def destroy
    id = params[:webhook_id]
    webhook = Webhook.where(:project_id => @project.id).where(:id => id).first
    if webhook.destroy
      flash[:notice] = l(:notice_successful_delete_webhook)
    else
      flash[:error] = l(:notice_fail_delete_webhook)
    end
    redirect_to settings_project_path(@project, :tab => 'webhook')
  end
end

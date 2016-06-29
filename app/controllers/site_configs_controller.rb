class SiteConfigsController < ApplicationController

  before_action :set_setting, only: :update
  before_action :signed_in_user
  before_action :user_activated

  def index
    #TODO dry settings list
  end

  def restart
    exit
  end

  def update
    respond_to do |format|
      @setting.value = params[:site_config][:value]
      if @setting.save!
        format.json { head :no_content, flash: {success: 'Settings were successfully updated.'} }
      else
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_setting
    @setting = SiteConfig.find(params[:id]) || SiteConfig.new
  end

end

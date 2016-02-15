class SiteSettingsController < ApplicationController
  before_action :signed_in_user
  before_action :user_activated

  def index
    # to get all items for render list
    @settings = SiteSettings.unscoped
  end

  def edit
    @setting = SiteSettings.unscoped.find(params[:id])
  end


end

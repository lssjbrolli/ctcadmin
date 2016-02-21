class SiteSettingsController < ApplicationController

  before_action :set_setting, only: [:update]
  before_action :signed_in_user
  before_action :user_activated

  def index
  end

  def update
  	respond_to do |format|
      @setting.value = params[:site_settings][:value]
  		if @setting.save
  			format.json { head :no_content, flash: {success: 'Expense was successfully updated.'}  }
  		else
  			format.json { render json: @trip_expense.errors, status: :unprocessable_entity }
  		end
  	end
  end

  private

  def set_setting
    @setting = SiteSettings.unscoped.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def settings_params
    params.require(:setting).permit(:value)
  end

end

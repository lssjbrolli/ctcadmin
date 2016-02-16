class SiteSettingsController < ApplicationController
  before_action :set_setting, only: [:update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  def index
    # to get all items for render list
    @settings = SiteSettings.unscoped
  end

  def update
	on_update(@set_settings_params)
	respond_to do |format|
		if @set_setting.update(set_settings_params)
			format.json { head :no_content, flash: {success: 'Expense was successfully updated.'}  }
		else
			format.json { render json: @trip_expense.errors, status: :unprocessable_entity }
		end
	end
  end

  def destroy
	@trip_expense.destroy
	respond_to do |format|
		format.html { redirect_to trip_expenses_url, flash: {success: 'Expense was successfully deleted.'} }
		format.json { head :no_content }
	end
  end

  private

  def set_setting
  	@setting = SiteSettings.unscoped.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def set_settings_params
	params.require(:setting).permit(:value)
  end

end

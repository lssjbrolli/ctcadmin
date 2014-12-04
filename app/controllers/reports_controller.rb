class ReportsController < ApplicationController
	before_action :signed_in_user
	before_action :user_activated

	def make_report
		@ids = []

		TripExpense.where(report: nil).each { |x| @ids << x.int_id }

		@report     = Report.new
		@report.ids = @ids

		respond_to do |format|
			if @report.save
				set_id
				format.html { redirect_to trip_expenses_path, flash: {success: 'Report was successfully created.'} }
			else
				format.html { redirect_to path, flash: {error: 'An error has occured, raport was not successfully created.'} }
			end
		end
	end

	def show
		@report = Report.find(params[:id])
		respond_to do |format|
			format.html do
				pdf = TripPdf.new(@report.ids.sort, view_context)
				send_data pdf.render, filename: "#{@report.id}.pdf",
									type:                 'application/pdf',
									disposition:          'inline'
			end
		end
	end

	private

	def set_id
		@ids.each { |x| TripExpense.find_by_int_id(x).update(report_id: @report.id) }
	end

end

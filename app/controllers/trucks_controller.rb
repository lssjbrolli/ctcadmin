class TrucksController < ApplicationController
	before_action :set_truck, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user
	before_action :user_activated

	# GET /trucks
	# GET /trucks.json
	def index
		@trucks = Truck.all
	end

	# GET /trucks/1
	# GET /trucks/1.json
	def show
	end

	def cnotes
		@truck  = Truck.find(params[:id])
		@cnotes = Truck.find(params[:id]).credit_notes
		@cn     = @cnotes.paginate(:page => params[:page], :per_page => 8).order('order_nr ASC')
	end

	# GET /trucks/new
	def new
		@truck = Truck.new
	end

	# GET /trucks/1/edit
	def edit
	end

	# POST /trucks
	# POST /trucks.json
	def create
		@truck = Truck.new(truck_params)

		respond_to do |format|
			if @truck.save
				format.html { redirect_to @truck, flash: {success: 'Truck was successfully created.'} }
				format.json { render action: 'show', status: :created, location: @truck }
			else
				format.html { render action: 'new' }
				format.json { render json: @truck.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /trucks/1
	# PATCH/PUT /trucks/1.json
	def update
		respond_to do |format|
			if @truck.update(truck_params)
				format.html { redirect_to @truck, flash: {success: 'Truck was successfully updated.'} }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @truck.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /trucks/1
	# DELETE /trucks/1.json
	def destroy
		@truck.destroy
		respond_to do |format|
			format.html { redirect_to trucks_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_truck
		@truck = Truck.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def truck_params
		params.require(:truck).permit(:registration)
	end

end

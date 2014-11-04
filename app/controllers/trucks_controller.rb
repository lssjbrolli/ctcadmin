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
    @truck = Truck.find(params[:id])
    @papers = @truck.papers
    #@paper = Paper.find(params[:id])
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
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, flash: {success: 'Truck was successfully updated.'} }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, flash: {success: 'Truck was successfully deleted.'} }
    end
  end

  def new_truck_paper
    @truck = Truck.find(params[:id])
    @paper = @truck.papers.build

    respond_to do |format|
      format.js
    end
  end

  def edit_truck_paper
    #@truck = Truck.find(params[:id])
    #@paper = @truck.find(params[:id])
    @paper = Paper.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_truck
    @truck = Truck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def truck_params
    params.require(:truck).permit(:registration, :vin, papers_attributes: [:id, :description, :expire, :_destroy])
  end

end

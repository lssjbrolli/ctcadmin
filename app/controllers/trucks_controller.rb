# frozen_string_literal: true

class TrucksController < ApplicationController
  include UserInfo

  before_action :set_truck, only: %i[show edit update destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.order('sold ASC, truck DESC').paginate(page: params[:page], per_page: 8)
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show; end

  def cnotes
    @truck = Truck.find(params[:id])
    @q = @truck.credit_notes.ransack(params[:q])
    @cn = @q.result(distinct: true).order('order_nr ASC').paginate(page: params[:page], per_page: 8)
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit; end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(truck_params)
    on_create(@truck)
    respond_to do |format|
      if @truck.save
        format.html { redirect_to truck_papers_path(@truck), flash: { success: 'Truck was successfully created.' } }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    on_update(@truck)
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to truck_papers_path(@truck), flash: { success: 'Truck was successfully updated.' } }
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
      format.html { redirect_to trucks_url, flash: { success: 'Truck was successfully deleted.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_truck
    @truck = Truck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def truck_params
    params.require(:truck).permit(:registration, :vin, :truck, :sold, papers_attributes: [:id, :description, :expire, :comments, :_destroy, attachments_attributes: %i[id file _destroy]])
  end
end

class EventsController < ApplicationController
  include UserInfo

  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /events
  # GET /events.json
  def index
    @truck = Truck.find(params[:truck_id])
    @q = @truck.events.ransack(params[:q])
    @events = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 8).order('date ASC')
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @truck = Truck.find(params[:truck_id])
    @event = @truck.events.build
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @truck = Truck.find(params[:truck_id])
  end

  # POST /events
  # POST /events.json
  def create
    @truck = Truck.find(params[:truck_id])
    @event = @truck.events.build(event_params)
    on_create(@event)
    respond_to do |format|
      if @event.save
        format.html { redirect_to truck_events_path(@truck), flash: {success: 'Event was successfully created.'} }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    on_update(@event)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to truck_events_url(@event.truck_id), flash: {success: 'Event was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to truck_events_url(@event.truck_id), flash: {success: 'Event was successfully deleted.'} }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:date, :km, :comment, :truck_id)
  end
end

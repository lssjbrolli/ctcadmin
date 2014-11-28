class PapersController < ApplicationController
  include UserInfo

  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated
  before_action :update_file, only: :update

  # GET /papers
  # GET /papers.json
  def index
    @truck = Truck.find(params[:truck_id])
    @papers = @truck.papers.paginate(:page => params[:page], :per_page => 7).order("expire ASC").order('description ASC')
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @truck = Truck.find(params[:truck_id])
    @paper = @truck.papers.build
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
    @truck = @paper.document
  end

  # POST /papers
  # POST /papers.json
  def create
    @truck = Truck.find(params[:truck_id])
    @paper = @truck.papers.build
    @paper.update_attributes(paper_params)
    on_create(@paper)
    respond_to do |format|
      if @truck.save
        format.html { redirect_to truck_papers_path(@truck), flash: {success: 'Paper was successfully created.'} }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    @truck = Truck.find(params[:truck_id])
    @paper = Paper.find(params[:id])
    on_update(@paper)
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to truck_papers_path(@truck), flash: {success: 'Paper was successfully updated.'} }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to truck_papers_url, flash: {success: 'Paper was successfully deleted.'} }
    end
  end

  private
  #replace file on update
  def update_file
    #check to see if there is a file to replace or just create a new record
    unless Paper.find(params[:id]).attachments.empty?
      #check to see if the user wants to replace the file or just edit paper attributes
      unless paper_params[:attachments_attributes]['0'][:id].nil?
        #Destroy the old record and create a new one with the same id
        #because carrier doesn't support editing file attribute
        Paper.find(params[:id]).attachments.destroy_all
        a = @paper.attachments.new
        a.update(id: paper_params[:attachments_attributes]['0'][:id])
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_paper
    @paper = Paper.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def paper_params
    params.require(:paper).permit(:description, :expire, :comments, attachments_attributes: [:id, :file, :_destroy])
  end

end

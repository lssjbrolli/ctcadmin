class PapersController < ApplicationController
  include UserInfo

  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated
  before_action :update_file, only: :update
  before_action :find_document

  # GET /papers
  # GET /papers.json
  def index
    @papers = @document.papers.paginate(:page => params[:page], :per_page => 14).order('expire ASC').order('description ASC')
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    # @papers = Paper.all.paginate(:page => params[:page], :per_page => 8).order('expire ASC').order('description ASC') FIX
  end

  # GET /papers/new
  def new
    @paper = @document.papers.build
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
    @truck = @paper.document # FIX
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = @document.papers.build
    @paper.update_attributes(paper_params)
    on_create(@paper)
    respond_to do |format|
      if @document.save
        format.html { redirect_to parent_url(@document), flash: { success: 'Paper was successfully created.' } }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    @paper = Paper.find(params[:id])
    on_update(@paper)
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to parent_url(@document), flash: { success: 'Paper was successfully updated.' } }
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
      format.html { redirect_to parent_url(@document), flash: { success: 'Paper was successfully deleted.' } }
    end
  end

  private

  # set document depending of class
  def find_document
    klass = [Truck, Employee].detect { |c| params["#{c.name.underscore}_id"] }
    @document = klass.find(params["#{klass.name.underscore}_id"])
  end

  # set proper url path
  def parent_url(parent)
    if params[:truck_id]
      truck_papers_path(parent)
    elsif params[:employee_id]
      employee_papers_path(parent)
    end
  end

  # replace file on update
  def update_file
    # check to see if there is a file to replace or just create a new record
    unless Paper.find(params[:id]).attachments.empty?
      # check to see if the user wants to replace the file or just edit paper attributes
      unless paper_params[:attachments_attributes]['0'][:id].nil?
        # Destroy the old record and create a new one with the same id
        # because carrier doesn't support editing file attribute
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
    params.require(:paper).permit(:description, :expire, :is_info, :comments, attachments_attributes: [:id, :file, :_destroy])
  end
end

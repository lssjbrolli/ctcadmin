class CreditNotesController < ApplicationController
	helper_method :sort_column, :sort_direction

	before_action :set_credit_note, only: [:show, :edit, :update, :destroy]
	before_action :signed_in_user
	before_action :user_activated

	# GET /credit_notes
	# GET /credit_notes.json
	def index
		@cnotes = CreditNote.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 8)
	end

	# GET /credit_notes/1
	# GET /credit_notes/1.json
	def show
	end

	# GET /credit_notes/new
	def new
		@credit_note = CreditNote.new
	end

	# GET /credit_notes/1/edit
	def edit
	end

	# POST /credit_notes
	# POST /credit_notes.json
	def create
		@credit_note = CreditNote.new(credit_note_params)
		respond_to do |format|
			if @credit_note.save
				format.html { redirect_to credit_notes_url, flash: {success: 'Credit note was successfully created.'} }
				format.json { render action: 'show', status: :created, location: @credit_note }
			else
				format.html { render action: 'new' }
				format.json { render json: @credit_note.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /credit_notes/1
	# PATCH/PUT /credit_notes/1.json
	def update
		respond_to do |format|
			if @credit_note.update(credit_note_params)
				format.html { redirect_to session.delete(:sega), flash: {success: 'Credit note was successfully updated.'} }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @credit_note.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /credit_notes/1
	# DELETE /credit_notes/1.json
	def destroy
		@credit_note.destroy
		respond_to do |format|
			format.html { redirect_to credit_notes_url, flash: {success: 'Credit note was successfully deleted.'} }
			format.json { head :no_content }
		end
	end

	private

	# Sortable methods
	def sort_column
		%w[number value paid].include?(params[:sort]) ? params[:sort] : 'number'
	end

	def sort_direction
		%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_credit_note
		@credit_note = CreditNote.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def credit_note_params
		params.require(:credit_note).permit(:number, :start, :stop, :week, :value, :paid, :currency, :notes, :truck_id, :order_nr, :file_cache, :file)
	end
end

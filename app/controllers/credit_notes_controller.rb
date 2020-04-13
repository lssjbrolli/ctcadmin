# frozen_string_literal: true

class CreditNotesController < ApplicationController
  include UserInfo

  before_action :set_credit_note, only: %i[show edit update destroy]
  before_action :signed_in_user
  before_action :user_activated
  before_action :uniq_id, only: :update

  # GET /credit_notes
  # GET /credit_notes.json
  def index
    @q = CreditNote.ransack(params[:q])
    @cnotes = @q.result(distinct: true).paginate(page: params[:page], per_page: 8)
  end

  # GET /credit_notes/1
  # GET /credit_notes/1.json
  def show; end

  # GET /credit_notes/new
  def new
    @credit_note = CreditNote.new
  end

  # GET /credit_notes/1/edit
  def edit
    session[:last_page] = request.env['HTTP_REFERER'] || credit_notes_url
  end

  # POST /credit_notes
  # POST /credit_notes.json
  def create
    @credit_note = CreditNote.new(credit_note_params)
    on_create(@credit_note)
    respond_to do |format|
      if @credit_note.save
        format.html { redirect_to credit_notes_url, flash: { success: 'Credit note was successfully created.' } }
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
    on_update(@credit_note)
    respond_to do |format|
      if @credit_note.update(credit_note_params)
        format.html { redirect_to session[:last_page], flash: { success: 'Credit note was successfully updated.' } }
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
      format.html { redirect_to credit_notes_url, flash: { success: 'Credit note was successfully deleted.' } }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_credit_note
    @credit_note = CreditNote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def credit_note_params
    params.require(:credit_note).permit(:number, :start, :stop, :week, :value, :paid, :currency, :notes, :truck_id, :order_nr, attachments_attributes: %i[id file _destroy file_cache])
  end

  # mass update if order_nr already exists
  def uniq_id
    unless credit_note_params[:order_nr].nil?
      unless credit_note_params[:order_nr].empty?
        clist = CreditNote.where('truck_id = :truck and order_nr = :order', { truck: @credit_note.truck_id, order: credit_note_params[:order_nr] })
        unless clist.empty?
          list = CreditNote.where('truck_id = :truck and order_nr >= :order', { truck: @credit_note.truck_id, order: credit_note_params[:order_nr] })
          list.each { |x| x.update_attribute('order_nr', x.order_nr + 1) }
        end
      end
    end
  end
end

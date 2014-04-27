class RaportsController < ApplicationController
  before_action :signed_in_user
  before_action :user_activated

  def make_raport
  	card_expenses = CardExpense.where(raport: false)
  	ids = []
  	card_expenses.each { |x| ids << x.id }
  	
  	raport = Raport.new
  	raport.ids = ids

  	respond_to do |format|
      if raport.save
        format.html { redirect_to card_expenses_path, flash: { success: 'Raport was successfully created.' }}
      else
      	format.html { redirect_to card_expenses_path, flash: { error: 'An error has occured, raport was not successfully created.' }}
      end
    end
  end

  def show
  	@raport = Raport.find(params[:id])
    respond_to do |format|
      format.pdf do 
        pdf = RaportPdf.new(@raport.ids, view_context)
        send_data pdf.render, filename: "#{@raport.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
       end
    end
  end

end

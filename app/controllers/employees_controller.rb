class EmployeesController < ApplicationController
  include UserInfo

  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  before_action :user_activated

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all.paginate(:page => params[:page], :per_page => 8).order('cnp ASC')
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  def show
  end

  #generate monthly payments reports
  def payment_report
    params['month'].empty? ? month = Date.today : month = params['month']
    respond_to do |format|
      format.html do
        pdf = PaymentReportPdf.new(month)
        send_data pdf.render, filename: "diurne #{month}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, flash: {success: 'Employee was successfully created.'} }
        format.json { render action: 'show', status: :created, location: @employee }
      else
        format.html { render action: 'new' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, flash: {succes: 'Employee was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :cnp, :bank_ron, :bank_eur, :activ)
  end
end

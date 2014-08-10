class UsersController < ApplicationController
  #before_action :admin, only: [:create, :update]
  before_action :signed_in_user, except: [:new, :create]
  before_action :correct_user, except: [:new, :create]
  before_action :user_activated, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, flash: {success: 'User was successfully created.'} }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.toggle!(:activated)
        format.html { redirect_to @user, flash: {success: 'User was successfully updated.'} }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :cnp, :language, :username, :password, :password_confirmation)
  end

  #def admin_params
  #  params.require(:user).permit( :activated ) if admin?
  #end

  def correct_user
    if @current_user.admin.nil?
      unless current_user?(@user)
        flash[:error] = 'Only the administrator can reach that page.'
        redirect_to(root_url)
      end
    end
  end

end

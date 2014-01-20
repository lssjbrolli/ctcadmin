class UsersController < ApplicationController

  before_action :admin, only: [:index]
  before_action :correct_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.new(user_params)

  	respond_to do |format|
  	  if @user.save
        sign_in @user
  	    format.html { redirect_to root_path, notice: 'User was successfully created.' }
  	    format.json { render action: 'show', status: :created, location: @user }
  	  else
  	    format.html { render action: 'new' }
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
      params.require(:user).permit(:first_name, :last_name, :cnp, :language, :username, :password, :password_confirmation )
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end

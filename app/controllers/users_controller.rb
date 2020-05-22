class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'user_layout' #this will check for flash alerts

  def index
    @users = User.all
    render template: "user/index.html.erb", layout: "users log in"
  end

  def new
    @user=User.new
  end

  def create
    #@user= User.new(params[:user])
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully!"
      flash[:color] = "valid"
      #redirect_to @user
      render template: "pages/index.html.erb"#, layout: "users log in"
    else
      flash[:notice] = " user or password was not correct. Please try again"
      flash[:color] = "invalid"
      render :new
    end
    #render :new
  end

  def update
    if @user.update(user_params) #if this returns not nill values, then it is success
      flash.notice = "The user record was created successfully."
      redirect_to @user
    else
      flash.now.alert =@user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
  #NEED A LINK HERE TO TAKE ME WHERE??????? <%= link_to "Home", root_path %>
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a lists of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :country)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to users_path
    end

end

class UsersController < ApplicationController
  before_action :is_login?
  before_filter :get_users, :only => ["create", "edit", "update", "index"]
  
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    render
  end
  
  def create
    @user = User.new(params_users)
    @user.password = 'qawsed!@#'
    @user.password_confirmation = 'qawsed!@#'
    @user.admin_id = current_user.id
    user_save = false
    if @user.save
      user_save = true
    else
      user_save = false
    end
    unless user_save == false
      @user.update_attributes(:confirmation_token => nil,:confirmed_at => Time.now,:reset_password_token => (0...16).map{(65+rand(26)).chr}.join,:reset_password_sent_at => Time.now)
      UserMailer.user_link(@user,current_user).deliver
    end
    respond_to do |format|
      format.js
    end
  end

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params_users)
      @user.update_attributes(:confirmation_token => nil,:confirmed_at => Time.now,:reset_password_token => (0...16).map{(65+rand(26)).chr}.join,:reset_password_sent_at => Time.now)
#      UserMailer.user_link(@user, current_user).deliver
      render
    else
      render :action => "edit"
    end
  end
  
  def update_user_to_active
    @user = User.find(params[:id])
    @user.update_attribute(:active, true)
    redirect_to "/"
  end
  
  private
  def params_users
    params.require(:user).permit!
  end
  
  def get_users
    @users = User.where("admin_id=? && role_type=?", current_user.id, "user").paginate(:per_page => 10, :page => params[:page])
  end
end

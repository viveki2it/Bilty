class BranchesController < ApplicationController
  before_action :is_login?
  #GET /branches/
  def index
    @branches = current_user.branches
  end
  
  #GET /branches/new
  def new
    @branch = current_user.branches.new
  end
  
  #POST /branches/
  def create
    @branch = current_user.branches.new(params_branch)
    if @branch.save
      flash[:notice] = "branch created successfully"
      redirect_to branches_path
    else
      render 'new'
    end
  end
  
  #Get /branches/:id/edit
  def edit
    @branch = Branch.find(params[:id])
  end
  
  #PATCH /branches/:id
  def update
    @branch = Branch.find(params[:id])
    if @branch.update_attributes(params_branch)
      flash[:notice] = "branch updated successfully"
      redirect_to branches_path
    else
      render 'edit'
    end
  end
  
  #DELETE /branches/:id
  def destroy
    @branch = Branch.find(params[:id])
    if @branch.destroy
      flash[:notice] = "branch deleted successfully."
      redirect_to branches_path
    else
      flash[:notice] = "branch deletion failed."
    end
  end
  
  #Get /branches/:id/get_cities
  def get_cities
    @indian_cities = IndianCity.where("city_state = ?", params[:id])
  end
  
  private
  def params_branch
    params.require(:branch).permit!
  end
end

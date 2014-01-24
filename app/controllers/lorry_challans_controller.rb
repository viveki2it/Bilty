class LorryChallansController < ApplicationController
  before_action :is_login?
  before_action :get_lorry_challan, :except => [:new, :create, :index]
  
  #GET /lorry_challans 
  def index
    @lorry_challans = current_user.lorry_challans
  end
  
  def new
    @lorry_challan = LorryChallan.new
    @lr_entries = current_user.lr_entries.order("created_at DESC")
  end
  
  def create
    @lorry_challan = LorryChallan.new(lorry_challan_params)  
    @lorry_challan.user_id = current_user.id
    if @lorry_challan.save
      params[:notice] = "LorryChallan has been created successfully."
      redirect_to edit_lorry_challan_path(@lorry_challan)
    else
      render :action => 'new'
    end
  end
  
  #GET /lr_entries/:id/edit
  def edit 
    @lr_entries = current_user.lr_entries.order("created_at DESC")
  end
  
  def destroy
    if @lorry_challan.destroy
      params[:notice] = "LorryChallan has been deleted successfully."
      redirect_to lr_entries_path
    else
      params[:error] = "LorryChallan deletion Failed."
    end
  end
  
  def update
     @lorry_challan.net_amount = ((@lorry_challan.gross_amt.to_f * @lorry_challan.service_tax.to_f)/100).to_f
    if @lorry_challan.update_attributes(lorry_challan_params)
      params[:notice] = "Invoice has been updated successfully."
      redirect_to edit_lorry_challan_path(@lorry_challan)
    else
      render :action => 'edit'
    end
  end
  
  def get_lorry_challan
    @lorry_challan = LorryChallan.find(params[:id])
  end
  
  def lorry_challan_params
    params.require(:lorry_challan).permit!
  end
  
end

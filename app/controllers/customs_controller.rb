class CustomsController < ApplicationController
  before_action :is_login?
  #GET /customs/
  def index
    @customs = current_user.custom_fields
  end
  
  #GET /customs/new
  def new
    @custom = current_user.custom_fields.new
  end
  
  #POST /customs/
  def create
    @custom = current_user.custom_fields.new(params_custom_fields)
    if @custom.save
      flash[:notice] = "Custom fields created successfully"
      redirect_to customs_path
    else
      render 'new'
    end
  end
  
  #Get /customs/:id/edit
  def edit
    @custom = CustomField.find(params[:id])
  end
  
  #PATCH /customs/:id
  def update
    @custom = CustomField.find(params[:id])
    if @custom.update_attributes(params_custom_fields)
      flash[:notice] = "Custom fields updated successfully"
      redirect_to customs_path
    else
      render 'edit'
    end
  end
  
  #DELETE /customs/:id
  def destroy
    @custom = CustomField.find(params[:id])
    if @custom.destroy
      flash[:notice] = "Custom fields deleted successfully."
      redirect_to customs_path
    else
      flash[:notice] = "Custom fields deletion failed."
    end
  end
  
  private
  def params_custom_fields
    params.require(:custom_field).permit!
  end
end

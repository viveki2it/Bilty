require 'csv'
class InvoicesController < ApplicationController
  autocomplete :indian_city, :city_name, :full => true

  before_action :get_invoice, :except => [:new, :create, :index, :invoice_params, :upload_cities, :autocomplete_indian_city_city_name]
  before_action :is_login?
  
  #GET /invoices/new 
  def new
    @invoice = Invoice.new   
    @custom_fields = current_user.custom_fields
  end
  
  #POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)  
    @invoice.user_id = current_user.id
    @custom_fields = current_user.custom_fields
    @invoice.net_payble = ((@invoice.gross_price.to_f * @invoice.service_tax.to_f)/100) + ((@invoice.gross_price.to_f * @invoice.fsc.to_f)/100) + @invoice.gross_price.to_f + @invoice.ins_price.to_f
    if @invoice.save
      unless @custom_fields.nil?
        @custom_fields.each do |custom_field|
          CustomFieldValue.create(:user_id => current_user.id, :custom_field_id => custom_field.id, :invoice_id => @invoice.id, :field_value => params["#{custom_field.id}"])
        end
      end
      params[:notice] = "Invoice has been created successfully."
      redirect_to invoice_path(@invoice)
    else
      render :action => 'new'
    end
  end
  
  #GET /invoices/
  def index
    @invoices = current_user.invoices.order("created_at DESC")
  end
  
  #GET /invoices/:id/edit
  def edit 
    @custom_fields = current_user.custom_fields
  end
  
  #PUT /invoices/:id
  def update
    @invoice.net_payble = ((@invoice.gross_price.to_f * @invoice.service_tax.to_f)/100) + ((@invoice.gross_price.to_f * @invoice.fsc.to_f)/100) + @invoice.gross_price.to_f + @invoice.ins_price.to_f
    if @invoice.update_attributes(invoice_params)
      @custom_fields = current_user.custom_fields
      unless @custom_fields.nil?
        @custom_fields.each do |custom_field|
          if CustomFieldValue.exists?(:invoice_id => @invoice.id)
            @field_value = CustomFieldValue.find_by_invoice_id(@invoice.id)
            @field_value.update_attribute(:field_value, params["#{custom_field.id}"])
          else
            CustomFieldValue.create(:user_id => current_user.id, :custom_field_id => custom_field.id, :invoice_id => @invoice.id, :field_value => params["#{custom_field.id}"])
          end
        end
      end
      params[:notice] = "Invoice has been updated successfully."
      redirect_to invoices_path
    else
      render :action => 'edit'
    end
  end
  
  #DELETE /invoice/:id  
  def destroy
    if @invoice.destroy
      params[:notice] = "Invoice has been deleted successfully."
      redirect_to invoices_path
    else
      params[:error] = "Invoice deletion Failed."
    end
  end
  
  #GET /invoice/:id
  def show
    @custom_fields_and_values = @invoice.custom_field_values
  end
  
  #This for getting invoice record.
  def get_invoice
    @invoice = Invoice.find(params[:id])
  end
  
  def upload_cities
    if request.post? 
      if params[:cities]
        IndianCity.delete_all
        CSV.parse(params[:cities][:cities].read) do |row|
          next if row[0].to_i == 0
        
          # row = row[0].to_s.split("\t").collect(&:strip)
          IndianCity.create({
              :city_name => row[1],
              :city_state => row[2]
            })
        end
      
        flash[:notice] = "Uploading completed."
        redirect_to root_path
      else
        redirect_to '/upload_cities'
      end
    else
      render :layout => false
    end
  end
  
  private
  def invoice_params
    params.require(:invoice).permit!
  end
end

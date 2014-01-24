class SearchesController < ApplicationController
  def index
    
  end
  
  def search_by_location
    if request.post?
      @status = false
      if params[:to_location].present? and params[:from_location].present?
        @invoices = current_user.invoices.where("to_location = ? && from_location = ?", params[:to_location], params[:from_location]).order("created_at DESC")
        @status = true
      else
        @error = "Must and should give To and From locations."
      end
    end
    render
  end
  
  def search_by_dates
    if request.post?
      @status = false
      if params[:to_date].present? and params[:from_date].present?
        if params[:to_date].to_date >  params[:from_date].to_date
          @invoices = current_user.invoices.where(:bilty_date => params[:from_date].to_date..params[:to_date].to_date).order("created_at DESC")
          @status = true
        else
           @error = "To date must be greater than to From date."
        end
      else
        @error = "Must and should give To and From dates."
      end
    end
    render
  end
  
  def search_by_bilty_no
    if request.post?
      @status = false
      if params[:bilty_no].present? 
        @invoices = current_user.invoices.where("bilty_no = ?", params[:bilty_no]).order("created_at DESC")
        @status = true
      else
        @error = "bilty no cann't blank."
      end
    end
    render
  end
end

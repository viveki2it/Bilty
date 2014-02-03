class SearchesController < ApplicationController
  def index
    
  end
  
  def search_by_location
    if request.post?
      @status = false
      if params[:to_location].present? and params[:from_location].present?
        @lr_entries = current_user.lr_entries.where("to_station = ? && from_station = ?", params[:to_location], params[:from_location]).order("created_at DESC")
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
          @lr_entries = current_user.lr_entries.where(:lr_date => params[:from_date].to_date..params[:to_date].to_date).order("created_at DESC")
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
        @lr_entries = current_user.lr_entries.where("lr_no = ?", params[:bilty_no]).order("created_at DESC")
        @status = true
      else
        @error = "bilty no cann't blank."
      end
    end
    render
  end
end

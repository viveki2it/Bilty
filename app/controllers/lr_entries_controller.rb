class LrEntriesController < ApplicationController
  before_action :is_login?
  before_action :get_lr_entry, :except => [:new, :create, :index, :change_branch_name]

  #GET /lr_entries
  def index
    @lr_entries = current_user.lr_entries.order("created_at DESC")
  end
  
  def new
    @lr_entry = LrEntry.new
  end
  
  def create
    @lr_entry = LrEntry.new(lr_entry_params)  
    @lr_entry.user_id = current_user.id
    @lr_entry.net_amount = ((@lr_entry.gross_amt.to_f * @lr_entry.service_tax.to_f)/100) + @lr_entry.gross_amt.to_f
    if @lr_entry.save
      params[:notice] = "LrEntry has been created successfully."
      redirect_to edit_lr_entry_path(@lr_entry)
    else
      render :action => 'new'
    end
  end
  
  #GET /lr_entries/:id/edit
  def edit 
  end
  
  def destroy
    if @lr_entry.destroy
      params[:notice] = "LrEntry has been deleted successfully."
      redirect_to lr_entries_path
    else
      params[:error] = "LrEntry deletion Failed."
    end
  end
  
  def update
    net_amount = ((@lr_entry.gross_amt.to_f * @lr_entry.service_tax.to_f)/100) + @lr_entry.gross_amt.to_f
    @lr_entry.update_attribute(:net_amount, net_amount)
    if @lr_entry.update_attributes(lr_entry_params)
      params[:notice] = "Invoice has been updated successfully."
      redirect_to edit_lr_entry_path(@lr_entry)
    else
      render :action => 'edit'
    end
  end
  
  def get_lr_entry
    @lr_entry = LrEntry.find(params[:id])
  end
  
  def change_branch_name
    @branch = Branch.find_by_name(params[:lr_entry_id])
    if LrEntry.exists?(:branch_name => params[:lr_entry_id], :lr_no => @branch.start_point)
      @lr_entry = LrEntry.where("branch_name = ?", params[:lr_entry_id]).last
      if @lr_no == @branch.end_point
        @lr_no = @lr_entry.lr_no 
      else
        if params[:ac] == "new"
          @lr_no = @lr_entry.lr_no + 1
        else
          @lr_no = @lr_entry.lr_no
        end
      end
    else
      @lr_no = @branch.start_point
    end
  end
  
  def lr_entry_params
    params.require(:lr_entry).permit!
  end
end

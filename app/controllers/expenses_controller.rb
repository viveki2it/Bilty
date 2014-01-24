class ExpensesController < ApplicationController
  before_action :is_login?
  #GET /expenses/
  def index
    @expenses = current_user.expenses
  end
  
  #GET /expenses/new
  def new
    @expense = current_user.expenses.new
  end
  
  #POST /expenses/
  def create
    @expense = current_user.expenses.new(params_expense)
    if @expense.save
      flash[:notice] = "expense created successfully"
      redirect_to expenses_path
    else
      render 'new'
    end
  end
  
  #Get /expenses/:id/edit
  def edit
    @expense = Expense.find(params[:id])
  end
  
  #PATCH /expenses/:id
  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(params_expense)
      flash[:notice] = "expense updated successfully"
      redirect_to expenses_path
    else
      render 'edit'
    end
  end
  
  #DELETE /expenses/:id
  def destroy
    @expense = Expense.find(params[:id])
    if @expense.destroy
      flash[:notice] = "expense deleted successfully."
      redirect_to expenses_path
    else
      flash[:notice] = "expense deletion failed."
    end
  end
  
  private
  def params_expense
    params.require(:expense).permit!
  end
  
end

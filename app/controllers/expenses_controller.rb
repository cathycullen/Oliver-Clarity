class ExpensesController < ApplicationController
    
def index
    @expenses = Expense.all
end
    
def new
    @expense = Expense.new
end
    
def update
    @expense = Expense.find(params[:id])
    if @expense.update(post_params)
        redirect_to user_path
    else
        render :edit
    end
end
    
def create
    @expense = Expense.new(expense_params)
    if @expense.save
        flash[:success] = "Expense recorded"
        redirect_to user_path
    else
        render 'new'
    end
end
    
def show
    @expense = Expense.find(params[:id])        
end

def edit
    @expense = Expense.find(params[:id])
end
    
def destroy
end

private

def expense_params
    params.require(:expense).permit(:date, :vendor, :amount)
end
    
end

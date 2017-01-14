class ExpensesController < ApplicationController

def index
    @expenses = Expense.all
end


def new
  @expense = Expense.new
  @user = User.find(params[:user_id])
end

def create
    @expense = Expense.new(expense_params)
    @user = User.find(params[:user_id])
    @expense.user = @user
    if @expense.save
        flash[:success] = "Expense recorded"
        redirect_to @user
    else
        render 'new'
    end
end

def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
        redirect_to @expense.user
    else
        render :edit
    end
end

def show
    @expense = Expense.find(params[:id])
end

def edit
    @expense = Expense.find(params[:id])
    @user =   @expense.user
end

def destroy
  @expense = Expense.find(params[:id])
  @user = @expense.user
  @expense.destroy
  redirect_to @user
end

private

def expense_params
    params.require(:expense).permit(:date, :vendor, :amount)
end

end

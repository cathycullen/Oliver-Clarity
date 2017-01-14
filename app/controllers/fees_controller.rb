require 'pry'
class FeesController < ApplicationController

def index
    @fee = Fee.all
end

def new
  @fee = Fee.new
  @user = User.find(params[:user_id])
end

def create
    @fee = Fee.new(fee_params)
    @user = User.find(params[:user_id])
    @fee.user = @user
    if @fee.save
        flash[:success] = "Fee recorded"
        redirect_to @user
    else
        render 'new'
    end
end

def edit
  @fee = Fee.find(params[:id])
  @user =   @fee.user
end

def update
    @fee = Fee.find(params[:id])
    if @fee.update(fee_params)
        redirect_to @fee.user
    else
        render :edit
    end
end

def show
    @fee = Fee.find(params[:id])
end

def destroy
  @fee = Fee.find(params[:id])
  @user = @fee.user
  @fee.destroy
  redirect_to @user
end

private

def fee_params
    params.require(:fee).permit(:date, :rate, :hours, :charge)
end

end

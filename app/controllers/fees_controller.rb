class FeesController < ApplicationController

def index
    @fee = Fee.all
end

def new
    @fee = Fee.new
end

def create
    @fee = Fee.new(fee_params)
    if @fee.save
        flash[:success] = "Fee recorded"
        redirect_to user_path
    else
        render 'new'
    end
end

def edit
    @fee = Fee.find(params[:id])
end

def update
    @fee = Fee.find(params[:id])
    if fee.update(post_params)
        redirect_to user_path
    else
        render :edit
    end
end

def show
    @fee = Fee.find(params[:id])
end

def destroy
end

private

def fee_params
    params.require(:fee).permit(:date, :rate, :hours, :charge)
end

end

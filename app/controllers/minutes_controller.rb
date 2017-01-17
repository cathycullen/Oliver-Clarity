class MinutesController < ApplicationController

def index
    @minutes = Minutes.all
end

def new
    @minute = Minute.new
    @user = User.find(params[:user_id])
end

def create
    @minute = Minute.new(minute_params)
    @user = User.find(params[:user_id])
    @minute.user = @user
    if @minute.save
        flash[:success] = "Minutes entered"
        redirect_to @user
    else
        render 'new'
    end
end

def show
    @minute = Minute.find(params[:id])
end

def edit
  @minute = Minute.find(params[:id])
  @user =   @minute.user
end

def update
    @minute = Minute.find(params[:id])
    if @minute.update(fee_params)
        redirect_to @minute.user
    else
        render :edit
    end
end

def destroy
  @minute = Minute.find(params[:id])
  @user = @minute.user
  @minute.destroy
  redirect_to @user
end

private

def minute_params
    params.require(:minute).permit(:name, :email, :company, :date, :kind, :attendees, :notice, :vote, :resolutions, :additional)
end

end

class MinutesController < ApplicationController
    
def index
    @minutes = Minutes.all
end

def new
    @minute = Minute.new
end

def create
    @minute = Minute.new(minute_params)
    if @minute.save
        flash[:success] = "Minutes entered"
        render 'info'
    else
        render 'new'
    end
end

def show
    @minute = Minute.find(params[:id])
end

def edit
end

def update
end

def destroy
end

private

def minute_params
    params.require(:minute).permit(:name, :email, :company, :date, :kind, :attendees, :notice, :vote, :resolutions, :additional)
end

end

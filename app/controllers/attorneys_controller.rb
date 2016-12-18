class AttorneysController < ApplicationController
    
def index
    @attorneys = Attorneys.all
end

def new
    @attorney = Attorney.new
end

def create
    @attorney = Attorney.new(attorney_params)
    if @attorney.save
        flash[:success] = "New attorney added"
        render 'index'
    else
        render 'new'
    end
end

def update
    @attorney = Attorney.find(params[:id])
    if @attorney.update(post_params)
        redirect_to @attorney
    else
        render :edit
    end
end

def show
    @attorney = Attorney.find(params[:id])
end

def destroy
end

private

def attorney_params
    params.require(:attorney).permit(:name, :address, :email, :phone, :license, :states, :practice)
end

end

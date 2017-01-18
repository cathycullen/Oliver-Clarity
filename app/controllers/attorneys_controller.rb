require 'pry'
class AttorneysController < ApplicationController

  before_action :admin_only,   only: [:index]

def index
  puts "attorneys_path #{attorneys_path}"
    @attorneys = Attorney.all
end

def new
    @attorney = Attorney.new
end

# GET /attorneys/1/edit
def edit
  puts "edit called on attorney controller params #{params}"
  @attorney = Attorney.find(params[:id])
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
  puts "destroy called on attorney controller"

  puts "params #{params}"
end

private

def attorney_params
    params.require(:attorney).permit(:name, :address, :email, :phone, :license, :states, :practice)
end

def admin_only
  redirect_to(root_url) unless current_user.try(:admin?)
end

end

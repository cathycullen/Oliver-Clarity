require 'pry'
class WebdocsController < ApplicationController

def new
    @webdoc = Webdoc.new
    @user = User.find(params[:user_id])
end

def create
    @webdoc = Webdoc.new(webdoc_params)
    @user = User.find(params[:user_id])
    @webdoc.user = @user

    if @webdoc.save
         flash[:success] = "Form submitted"
        redirect_to @user
    else
        render 'new'
    end
end

def update
    @webdoc = Webdoc.find(params[:id])
    @user = @webdoc.user
    if @webdoc.update_attributes(webdoc_params)
         flash[:success] = "Update request submitted"
        redirect_to @user
    else
        render 'edit'
    end
end

def edit
    @webdoc = Webdoc.find(params[:id])
    @user =   @webdoc.user
end

def show
    @webdoc = Webdoc.find(params[:id])
end

def destroy
    @webdoc = Webdoc.find(params[:id])
    @user =   @webdoc.user
    @webdoc.destroy
    flash[:success] = "Webdocs deleted"
    redirect_to @user
end

private

def webdoc_params
    params.require(:webdoc).permit(:url, :state, :children, :products, :similar, :user_id, :file)
end
end

class WebdocsController < ApplicationController
    
def new
    @webdoc = Webdoc.new
end

def create
    @webdoc = Webdoc.new(webdoc_params)
    if @webdoc.save
         flash[:success] = "Form submitted"
        redirect_to @user
    else
        render 'new'
    end
end

def update
    @webdoc = Webdoc.find(params[:id])
    if @webdoc.update_attributes(webdoc_params)
         flash[:success] = "Update request submitted"
        redirect_to @user
    else
        render 'edit'
    end
end

def edit
    @webdoc = Webdoc.find(params[:id])
end

def show
    @webdoc = Webdoc.find(params[:id])
end

def destroy
    Webdoc.find(params[:id]).destroy
    flash[:success] = "Webdocs deleted"
    redirect_to @user
end

private

def webdoc_params
    params.require (:webdoc).permit(:name, :email, :owner, :url, :state, :children, :products, :similar)
end

end

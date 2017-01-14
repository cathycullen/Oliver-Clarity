class MarksController < ApplicationController

def index
end

def new
  @mark = Mark.new
  @user = User.find(params[:user_id])
end

def create
    @mark = Mark.new(mark_params)
    @user = User.find(params[:user_id])
    @mark.user = @user
    if @mark.save
        flash[:success] = "Trademark recorded"
        redirect_to @user
    else
        render 'new'
    end
end

def update
    @mark = Mark.find(params[:id])
    if @mark.update(mark_params)
        redirect_to @mark.user
    else
        render :edit
    end
end

  def edit
      @mark = Mark.find(params[:id])
      @user =   @mark.user
  end

  def destroy
    @mark = Mark.find(params[:id])
    @user = @mark.user
    @mark.destroy
    redirect_to @user
  end

def show
    @mark = Mark.find(params[:id])
end

private

def mark_params
    params.require(:mark).permit(:contact, :email, :owner, :entity, :address, :description, :colors, :anywhere,
       :commerce, :products, :aural, :serial, :registration, :next, :deadline)
end
end

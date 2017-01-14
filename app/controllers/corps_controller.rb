require 'pry'
class CorpsController < ApplicationController

    def index
    end


    def new
      @corp = Corp.new
      @user = User.find(params[:user_id])
    end

    def create
        @corp = Corp.new(corp_params)
        @user = User.find(params[:user_id])
        @corp.user = @user
        binding.pry
        if @corp.save
            flash[:success] = "Corp recorded"
            redirect_to @user
        else
            render 'new'
        end
    end

    def update
        @corp = Corp.find(params[:id])
        if @corp.update(corp_params)
            redirect_to @corp.user
        else
            render :edit
        end
    end

    def edit
        @corp = Corp.find(params[:id])
        @user =   @corp.user
    end

    def destroy
      @corp = Corp.find(params[:id])
      @user = @corp.user
      @corp.destroy
      redirect_to @user
    end

    def show
    end

    private

    def corp_params
       params.require(:corp).permit(:contact, :email, :entity, :owners, :office, :state, :company,
       :business, :regagent, :regoffice, :incorporation, :ein, :next)
    end
end

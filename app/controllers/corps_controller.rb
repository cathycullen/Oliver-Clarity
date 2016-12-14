class CorpsController < ApplicationController
    
    def index
    end
    
    def new
        @corp = Corp.new
    end
    
    def create
        @corp = Corp.new(corp_params)
        if @corp.save
            flash[:success] = "Form completed"
            render 'info'
        else
            render 'new'
        end
    end
    
    def update
    end
    
    def edit
    end
    
    def show
    end
    
    def destroy
    end

    private
    
    def corp_params
       params.require(:corp).permit(:contact, :email, :entity, :owners, :office, :state, :company,
       :business, :regagent, :regoffice)
    end
end

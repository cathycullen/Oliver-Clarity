class MarksController < ApplicationController
    
    def index
    end
    
    def new
        @mark = Mark.new
    end
    
    def create
        @mark = Mark.new(mark_params)
        if @mark.save
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
        @mark = Mark.find(params[:id])
    end
    
    def destroy
    end
   
   private
   
   def mark_params
       params.require(:mark).permit(:contact, :email, :owner, :entity, :address, :description, :colors, :anywhere,
       :commerce, :products, :aural, :serial, :registration, :next, :deadline)
   end
end

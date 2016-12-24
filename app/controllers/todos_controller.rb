class TodosController < ApplicationController
    
def index
    @todos = Todos.all
end

def new
    @todo = Todo.new
end
end

require 'pry'
class TodosController < ApplicationController

def index
    @todos = Todos.all
end

def new
  puts "params #{params}"
  @user = User.find(params[:user_id])
  puts "@user #{@user}"
  @todo = Todo.new
end

def create
    puts "params #{params}"
    @todo = Todo.new(todo_params)
    @user = User.find(params[:user_id])
    @todo.user = @user

    if @todo.save
        flash[:success] = "Todo created"
    else
        flash[:success] = "Unable to save Todo"
    end
    redirect_to @user
  end


def edit
    @todo = Todo.find(params[:id])
end


def show
  @todo = Todo.find(params[:id])
end

def update
  @todo = Todo.find(params[:id])
  if @todo.update_attributes(todo_params)
    flash[:success] = "Todo updated"
    # we want to rediret to users page
    @user = get_user(@todo)
    redirect_to @user
  else
    render 'edit'
  end
end

def destroy
  puts "params #{params}"
  @todo = Todo.find(params[:id])
  @todo.destroy

  redirect_to @user
end

private

def todo_params
  params.require(:todo).permit(:item)
end

def get_user(todo)
  @user = User.find(@todo.user_id)
end
end

require 'pry'
class UsersController < ApplicationController

before_action :logged_in_user, only: [:edit, :update, :destroy]
before_action :correct_user,   only: [:edit, :update, :show]
before_action :admin_only,   only: [:index]
before_action :authorize

def index
  @users = User.all
end

def show
  @user = User.find(params[:id])
  @fees_total = 0
  @expenses_total = 0
end

def new
  @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

def create_old
  @user = User.new(user_params)
  if @user.save
   @user.send_activation_email
   flash[:info] = "Please check your email to activate your account."
   redirect_to root_url
  else
      render 'new'
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
  else
    render 'edit'
  end
end

# def destroy
#   User.find(params[:id]).destroy
#   flash[:success] = "User deleted"
#   redirect_to users_url
# end

def destroy
  puts "params #{params}"
    # @user = User.find(params[:id])
    # @attorney = attorney.find(params[:id])
    # @comment.destroy
    #
    # respond_to do |format|
    #   format.html { redirect_to post_comments_path(@post) }
    #   format.xml  { head :ok }
    # end
  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

def logged_in_user
  unless logged_in?
  store_location
  flash[:danger] = "Please log in."
  redirect_to login_url
  end
end

def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless authorized?(@user)
end

def authorized?(user)
   current_user?(user)  || current_user.try(:admin?)
end

def admin_only
  redirect_to(root_url) unless current_user.try(:admin?)
end

end

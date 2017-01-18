require 'pry'
class UsersAttorneysController < ApplicationController

  def index
      @users_attorneys = UsersAttorney.all
  end

  def new
    @user = User.find(params[:user_id])
    @users_attorney = UsersAttorney.new
    @attorney_names = Attorney.all
  end

# GET /users_attorneys/1/edit
 def edit
   puts "edit called on users_attorneys controller params #{params}"
   @users_attorney = UsersAttorney.find(params[:id])
 end

 def create
   @user = User.find(params[:user_id])
   x = users_attorney_params
   binding.pry
   @users_attorney = UsersAttorney.new(users_attorney_params)
   if @users_attorney.save
       flash[:success] = "New user attorney added"
       redirect_to @user
   else
       render 'new'
   end
 end

 def update
     @users_attorney = UsersAttorney.find(params[:id])
     if @users_attorney.update(users_attorney_params)
         redirect_to users_attorneys_path
     else
         render :edit
     end
 end

 private

 def users_attorney_params
     params.require(:users_attorney).merge(user_id: params[:user_id]).permit(:attorney_id, :user_id)
 end

 def admin_only
   redirect_to(root_url) unless current_user.try(:admin?)
 end



end

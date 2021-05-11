class UsersController < ApplicationController
   before_action :authenticate_user!
    def index
        @users = User.all
        @user = current_user
        @books = Book.all
        @book = Book.new
        @book.user_id = current_user.id
    end
    
    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = Book.where(user_id: params[:id])
    end
    
   def edit
        @user = User.find(params[:id])
      if @user.id != current_user.id
         redirect_to user_path(current_user)
      end
   end
   
   def update
        @user = User.find(params[:id])
         @user.update(user_params)
     if  @user.save
           redirect_to user_path, notice: "You have updated user successfully."
     else
            @users = User.all
            render :edit
     end
   end
   
   
 private
 
 
   def user_params
         params.require(:user).permit(:name, :introduction, :profile_image)
   end
   
end


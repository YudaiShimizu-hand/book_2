class UsersController < ApplicationController
    def index
        @user = current_user
        @books = Book.all
        @book = Book.new
        @book.user_id = current_user.id
    end
    
    def show
        @user = User.find(params[:id])
        @books = Book.all
        @book = Book.new
    end
    
   def edit
        @user = User.find(params[:id])
   end
   
   def update
        @user = current_user
     if @user.update(user_params)
           flash[:notice] = "You have updated book successfully."
           redirect_to user_path(@user.id)
     else
            render :edit
     end
   end
   
   
 private
 
 
   def user_params
         params.require(:user).permit(:name, :introduction, :profile_image)
   end
   
end


class BooksController < ApplicationController
      before_action :authenticate_user!
      before_action :correct_user, only: [:edit, :update]
     
    def create
         @book = Book.new(book_params)
         @book.user_id = current_user.id
      if @book.save
         redirect_to book_path(@book),  notice: "You have created book successfully."
      else
         @books = Book.all
         @user = current_user
         render :index
      end
    end

    def index
        @book = Book.new
        @books = Book.all
        @user = current_user
    end

    def show
        @book = Book.find(params[:id])
        @user = User.find(@book.user.id)
        @books = Book.new
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
      if @book.update(book_params)
          redirect_to book_path(@book.id), notice: "You have created book successfully."
      else
        #   @users = User.all
          render :edit
      end
    end

    def destroy
       book = Book.find(params[:id])
      if book.user_id =! current_user.id
      else
         book.destroy
         redirect_to books_path
      end
    end

    def correct_user
         @book = Book.find(params[:id])
       if @book.user_id != current_user.id
          redirect_to books_path
       end
    end
    
    private

    
    def book_params
         params.require(:book).permit(:title, :body)
    end
end

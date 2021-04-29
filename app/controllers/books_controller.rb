class BooksController < ApplicationController
    
    def create
         book = Book.new(book_params)
         book.user_id = current_user.id
         book.save
         redirect_to book_path(book)
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user.name
    end

    def show
        @books = Book.all
        @book = Book.new
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        book = Book.find(params[:id])
        book.user_id = current_user.id
        book.update(book_params)
        redirect_to book_path
    end

    def destroy
       book = Book.find(params[:id])
       book.user_id = current_user.id
       book.destroy
       redirect_to books_path
    end
    
    private
    
    def book_params
         params.require(:book).permit(:title, :opinion)
    end
end

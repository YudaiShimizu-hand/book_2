class BooksController < ApplicationController
    
    def create
         @book = Book.new(book_params)
         @book.user_id = current_user.id
         @book.save
    end

    def index
        @books = Book.all
        @book = Book.new
    end

    def show
    end
    
    def edit
    end
    
    def update
    end

    def destroy
    end
    
    private
    
    def book_params
         params.require(:book).permit(:title, :opinion)
    end
end

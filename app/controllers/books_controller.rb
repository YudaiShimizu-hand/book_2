class BooksController < ApplicationController
    def create
         @user = current_user
         @books = Book.all
         @book = Book.new(book_params)
         @book.user_id = @user.id
      if @book.save
         flash[:notice] = "You have updated book successfully."
         render :show
      else
         @books = Book.all
         render :index
      end
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = current_user
    end

    def show
        @book = Book.new
        @books = Book.all
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @books = Book.all
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
       if @book.update(book_params)
          flash[:notice] = "You have updated book successfully."
           render :show
       else
           @books = Book.all
           render :edit
       end
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

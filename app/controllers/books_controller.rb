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
        @user = current_user
    end
    
    def edit
        @book = Book.find(params[:id])
       unless @book.user == current_user
       end
    end
    
    def update
        @books = Book.all
        @book = Book.find(params[:id])
      if  @book.user_id =! current_user.id
          
      else
       if @book.update(book_params)
          flash[:notice] = "You have updated book successfully."
           render :show
       else
           @books = Book.all
           render :edit
       end
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
    
    private
    
    def book_params
         params.require(:book).permit(:title, :body)
    end
end

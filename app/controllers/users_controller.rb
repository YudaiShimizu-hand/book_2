class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @books = Book.all
        @book = Book.new
    end
end

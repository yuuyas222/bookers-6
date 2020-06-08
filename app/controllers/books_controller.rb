class BooksController < ApplicationController
    before_action :authenticate_user!
    def create 
        @user = current_user
        flash[:notice] = "You have creatad book successfully."
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to book_path(@book.id)
        else
            render "books/index"
        end
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
        
    end

    def show
        @bookcreate = Book.find(params[:id]) 
        @user = @bookcreate.user
        @book = Book.new
        @books = Book.all
        @comment = BookComment.new
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
          end
    end

    def update
        @book = Book.find(params[:id])
        flash[:notice] = "You have updated user successfully."
        if @book.update(book_params)
            redirect_to book_path(@book.id)
            flash[:notice] = "You have updated user successfully."
           else
            render :edit
         end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private 
     def book_params
        params.require(:book).permit(:title, :body)
     end

end

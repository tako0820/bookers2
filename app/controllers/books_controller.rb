class BooksController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
    @current_user=current_user
  end

  def new
    @book = Book.new
  end

  def show
    @books=Book.all
    @book_new=Book.new
    @user=current_user
    @book=Book.find(params[:id])
    @current_user=current_user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def create
    @user=current_user
    @books=Book.all
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice]="You have created book successfully."
    else
     render :index
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    @book.user_id = current_user.id
    redirect_to user_path(@book.user_id)
    flash[:notice]="You have updated book successfully."
    else
      render :edit
    end

  end

  private

    def book_params
     params.require(:book).permit(:title, :body)
    end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end

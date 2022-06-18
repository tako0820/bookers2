class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def new
    @book = Book.new
  end

  def show
    @books=Book.all
    @book_new=Book.new
    @user=current_user
    @book=Book.find(params[:id])

  end

  def edit
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save

    redirect_to book_path(@book.id)

  end

  def update
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

    def book_params
     params.require(:book).permit(:title, :body)
    end
end
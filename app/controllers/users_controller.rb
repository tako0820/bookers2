class UsersController < ApplicationController
  def show
    @book=Book.new
    @current_user=current_user
    @user = User.find(params[:id])
    @books= @user.books

  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
    @book=Book.new
    @current_user=current_user
    @users=User.all
  end

  def edit
    @user=User.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save

    redirect_to book_path(@book.id)
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

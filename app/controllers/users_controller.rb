class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @book=Book.new
    @current_user=current_user
    @user=User.find(params[:id])
    @books= @user.books
  end

  def new
    @book = Book.new
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end

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
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    @current_user=current_user
    redirect_to(user_path(@current_user.id)) unless @user == current_user
  end

end

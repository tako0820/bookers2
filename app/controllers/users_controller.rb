class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def index
    @book=Book.new
    @current_user=current_user
    @users=User.all

  end

end

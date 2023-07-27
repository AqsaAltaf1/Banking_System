class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: %i[index new create]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit 
  end

  def update
    if @user.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def destroy 
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @gifs = Gif.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account Created!"
      redirect_to root_path
    else
      flash.now[:error] = "Invalid input"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end

end

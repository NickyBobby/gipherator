class UsersController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def show
    @user = User.find(params[:id])
  end

end

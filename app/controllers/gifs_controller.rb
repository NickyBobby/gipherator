class GifsController < ApplicationController

  def update
    gif = Gif.find(params[:id])
    if current_user && !current_user.gifs.include?(gif)
      current_user.gifs << gif
      redirect_to root_path
    else
      flash[:error] = "#{gif.name} is already a favorite"
      redirect_to root_path
    end
  end

  def destroy
    current_user.gifs.destroy(params[:id])
    redirect_to current_user
  end

end

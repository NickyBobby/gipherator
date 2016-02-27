class GifsController < ApplicationController

  def update
    if current_user
      current_user.gifs << Gif.find(params[:id])
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end

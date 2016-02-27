class GifsController < ApplicationController

  def update
    current_user.gifs << Gif.find(params[:id])
    redirect_to root_path
  end

end

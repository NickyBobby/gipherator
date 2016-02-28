require "faraday"
require "json"

class Admin::GifsController < ApplicationController
  include ApiJuicer
  def index
    @gif = Gif.new
  end

  def create
    image_path = find_by_keyword(params[:gif][:category])
    @gif = Gif.create(name: params[:gif][:category], image_path: image_path)
    redirect_to current_user
  end

  def edit
    @gif = Gif.find(params[:id])
  end

  def update
    @gif = Gif.find(params[:id])
    @gif.update(gif_params)
    if @gif.valid?
      flash[:success] = "GIF was updated successfully!!"
      redirect_to root_path
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end


private

  def gif_params
    params.require(:gif).permit(:name, :image_path)
  end
end

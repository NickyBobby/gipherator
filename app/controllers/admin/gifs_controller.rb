require "faraday"
require "json"

class Admin::GifsController < ApplicationController

  def index
    # Hit Giphy API and return sample of random GIFs
    # gifs = Gif.all
    @gif = Gif.new
  end
  #
  def create
    url = "http://api.giphy.com/v1/gifs/search?q=#{params[:gif][:category]}&api_key=dc6zaTOxFJmzC"
    response = Faraday.get(url)
    raw_data = response.body
    data = JSON.parse(raw_data)
    image_path = data["data"].sample["images"]["fixed_height"]["url"]

    @gif = Gif.create(name: params[:gif][:category], image_path: image_path)
    redirect_to current_user
  end
end

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
end

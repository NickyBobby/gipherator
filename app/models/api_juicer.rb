module ApiJuicer
  def find_by_keyword(params)
    url = "http://api.giphy.com/v1/gifs/search?q=#{params}&api_key=dc6zaTOxFJmzC"
    response = Faraday.get(url)
    raw_data = response.body
    data = JSON.parse(raw_data)
    data["data"].sample["images"]["fixed_height"]["url"]
  end

  def trending_right_now
    url = "http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC"
    response = Faraday.get(url)
    raw_data = response.body
    data = JSON.parse(raw_data)
    data["data"].map { |datum| datum["images"]["fixed_height"]["url"] }
  end
end

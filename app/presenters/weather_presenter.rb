class WeatherPresenter
  def initialize(data)
    @data = data
  end

  attr_reader :data

  def location
    data.dig('location', 'name')
  end
  def description
    data["current"][ "condition"]["text"]
  end

  def temperature
    data["current"][ "temp_c"]
  end
  def icon
    data["current"][ "condition"]["icon"]
  end


  def nice_weather?
    description == 'Sunny' || 'Partly cloudy'
  end
  def good_to_read_outside?
    nice_weather? && temperature > 15
  end
  def encourage_text
    if good_to_read_outside?
      "Get some snacks and go read a book in a park!"
    else
      "It's always a good weather to read a book!"
    end
  end

end


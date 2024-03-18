module ApplicationHelper
  def bootstrap_flash_class(type)
    case type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end


  def weather_data
    @weather_data ||= WeatherApiConnector.new.weather_data
  end

  def weather_presenter
    @weather_presenter ||= WeatherPresenter.new(weather_data)
  end
end

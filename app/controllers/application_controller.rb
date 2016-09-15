class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    # call scrape function here
    render "/index.html.erb"
  end

  def Scrape
    Scrapper.eatnow
  end

end

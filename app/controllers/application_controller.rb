class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # after_index :scrape

  def index
    # call scrape function here
    # Scrapper.eatnow
    render "/index.html.erb"
  end

  def scrape
    # Scrapper.eatnow
  end

end

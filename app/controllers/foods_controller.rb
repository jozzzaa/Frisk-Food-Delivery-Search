class FoodsController < ApplicationController

  def index

    @hey = params[:search]

    @foods = Food.all






    render "/results.html.erb"
  end

end

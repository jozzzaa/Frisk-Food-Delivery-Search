class FoodsController < ApplicationController

  def index

    @foods = Food.all

    render "/results.html.erb"
  end

end

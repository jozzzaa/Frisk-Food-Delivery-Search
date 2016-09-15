module Api

  class FoodsController < ApplicationController

    def present

      @food_display = Food.where(name: params[:search])
      render json: @food_display

    end

  end

end

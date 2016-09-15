module Api

  class FoodsController < ApplicationController

    def present

      food_search = Food.where(name: params[:search])

      json = []

      food_search.each do |food|

        food_json = {
          name: food.name,
          image: food.image_url,
          address_street: food.address_street,
          address_suburb: food.address_suburb,
          provider: food.provider,
          tags: food.tags.pluck(:tag)
        }

        json << food_json

      end

      render json: json
      
    end

  end

end

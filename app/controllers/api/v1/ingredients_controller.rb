module Api
  module V1
    class IngredientsController < ApplicationController

      def create
        # byebug
        @ingredient = Ingredient.create(ingredient_params)
        render json: @ingredient
      end

      def ingredient_params
        params.require(:ingredient).permit(:name)
      end

    end
  end
end

module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }

        render json: cocktail_json
      end

      def create
        byebug
        @cocktail = Cocktail.create(cocktail_param)
        render json: @cocktail
      end

      def update
        @cocktail = Cocktail.find(params[:id])
        @cocktail.update(params[:proportions][0])
        render json: @cocktail
      end

      def cocktail_param
        params.require(:cocktail).permit(:id, :name, :description, :instructions)
      end

    end
  end
end

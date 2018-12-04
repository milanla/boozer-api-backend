module Api
  module V1
    class ProportionsController < ApplicationController

      def create
        @proportion = Proportion.create(proportion_params)
        render json: @proportion
      end

      def proportion_params
        params.require(:proportion).permit(:amount, :cocktail_id, :ingredient_id)
      end

    end
  end
end

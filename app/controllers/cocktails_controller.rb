class CocktailsController < ApplicationController
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(params)
    if @cocktail.valid?
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

end

class CocktailsController < ApplicationController
  def home
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new()
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail= Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    cocktail_to_delete = Cocktail.find(params[:id])
    cocktail_to_delete.destroy
    redirect_to cocktail_path
  end


    private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end

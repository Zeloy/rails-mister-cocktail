class DosesController < ApplicationController

  before_action :set_cocktail_method, except: :destroy

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose_to_delete = Dose.find(params[:id])
    dose_to_delete.destroy
    redirect_to cocktail_path(dose_to_delete.cocktail)
  end

  private

   def set_cocktail_method
      @cocktail = Cocktail.find(params[:cocktail_id])
   end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

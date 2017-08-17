class DosesController < ApplicationController

before_action :set_cocktail_method, except: :destroy

    def new
      @dose = Dose.new()

    end

    def create
      @dose = Dose.new(dose_params)
      if @dose.save
        redirect_to cocktail_path(@dose.cocktail)
      else
        render :new
      end
    end

    def destroy
      dose_to_delete = Dose.find(params[:id])
      dose_to_delete.destroy
      redirect_to dose_path
    end

    private

   def set_cocktail_method
      @cocktail = Cocktail.find(params[:cocktail_id])
   end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

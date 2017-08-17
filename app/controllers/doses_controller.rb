class DosesController < ApplicationController

    def new
      @doses  = Dose.new()

    end

    def create
      @dose = Dose.new(dose_params)
      if @dose.save
        redirect_to dose_path(@dose)
      else
        render :new
      end
    end

    def destroy
      dose_to_delete = Dose.find(params[:id])
      dose_to_delete.destroy
      redirect_to article_path
    end

    private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

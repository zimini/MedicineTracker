class DrugsController < ApplicationController
  before_action :set_prescription

  def new
    @drug = @prescription.drugs.build
  end

  def create
    @drug = @prescription.drugs.build(drug_params)
    if @drug.save
      # redirect_to [@prescription, @drug], notice: 'Drug created successfully'
      redirect_to @prescription, notice: 'Drug created successfully'
    else
      flash.now[:alert] = 'Drug not created'
      render :new
    end
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end

  def drug_params
    params.require(:drug).permit(:brand, :name, :dose)
  end
end

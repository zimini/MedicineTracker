class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show]
  def index
    @prescriptions = current_user.prescriptions
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = current_user.prescriptions.build(prescription_params)
    if @prescription.save
      redirect_to @prescription, notice: 'Prescription successfully created'
    else
      flash.now[:alert] = 'Prescription not created'
      render :new
    end
  end

  def show

  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:clinic, :date)
  end

end

class PrescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prescription, only: [:show, :edit, :update]

  def index
    @prescriptions = current_user.prescriptions
  end

  def new
    @prescription = current_user.prescriptions.build
  end

  def create
    @prescription = current_user.prescriptions.build(prescription_params)
    if @prescription.save
      redirect_to @prescription, notice: 'Prescription created successfully'
    else
      flash.now[:alert] = 'Prescription not created'
      render :new
    end
  end

  def show
    @drugs = @prescription.drugs
  end

  def edit
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: 'Prescription updated successfully'
    else
      flash.now[:alert] = 'Prescription not updated'
      render :new
    end
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:clinic, :date)
  end

end

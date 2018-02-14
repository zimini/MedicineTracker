class PrescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prescription, only: [:show, :edit, :update, :destroy, :add_drug, :remove_drug]
  before_action :set_drug, only: [:add_drug, :remove_drug]

  def index
    @prescriptions = current_user.prescriptions
  end

  def new
    @prescription = current_user.prescriptions.build
  end

  def create
    @prescription = current_user.prescriptions.build(prescription_params)
    if @prescription.save
      flash[:success] = 'Prescription created successfully'
      redirect_to @prescription
    else
      flash.now[:alert] = 'Prescription not created'
      render :new
    end
  end

  def show
    @prescription_drugs = @prescription.drugs
    @all_drugs = current_user.drugs
    @available_drugs = @all_drugs - @prescription_drugs
  end

  def edit
  end

  def update
    if @prescription.update(prescription_params)
      flash[:success] = 'Prescription updated successfully'
      redirect_to @prescription
    else
      flash.now[:alert] = 'Prescription not updated'
      render :new
    end
  end

  def destroy
    if @prescription.destroy
      flash[:success] = 'Prescription deleted'
      redirect_to prescriptions_path
    else
      flash.now[:alert] = 'Something went wrong while trying to delete prescription'
      render :edit
    end
  end

  def add_drug
    @prescription.drugs << @drug
    respond_to do |format|
      format.js {}
    end
  end

  def remove_drug
    @prescription.drugs.delete( @drug )
    respond_to do |format|
      format.js {}
    end
  end

  private

  def set_prescription
    @prescription = current_user.prescriptions.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    flash[:alert] = 'The prescription you were looking for could not be found'
    redirect_to prescriptions_path
  end

  def set_drug
    @drug = current_user.drugs.find(params[:drug_id])
  end

  def prescription_params
    params.require(:prescription).permit(:clinic, :date)
  end

end

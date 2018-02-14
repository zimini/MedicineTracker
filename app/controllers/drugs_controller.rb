class DrugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drug, only: [:edit, :update, :destroy]

  def new
    @drug = current_user.drugs.build
  end

  def create
    @drug = current_user.drugs.build(drug_params)
    if @drug.save
      flash[:success] = 'Medication created successfully'
      redirect_to drugs_path
    else
      flash.now[:alert] = 'Medication not created'
      render :new
    end
  end

  def index
    @drugs = current_user.drugs
  end

  def edit
  end

  def update
    if @drug.update(drug_params)
      flash[:success] = 'Medication updated successfully'
      redirect_to drugs_path
    else
      flash.now[:alert] = 'Medication not updated'
      render :new
    end
  end

  def destroy
    if @drug.destroy
      flash[:success] = 'Medication deleted'
      redirect_to drugs_path
    else
      flash.now[:alert] = 'Something went wrong while trying to delete medication'
      render :edit
    end
  end

  private

  def set_drug
    @drug = current_user.drugs.find(params[:id])
  end

  def drug_params
    params.require(:drug).permit(:brand, :name, :dose)
  end
end

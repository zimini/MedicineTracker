class DrugEntriesController < ApplicationController
  before_action :set_diary, only: [:create]
  before_action :set_prescription, only: [:create]

  def create
    @drug = @prescription.drugs.find(diary_drug_params[:drug_id])
    @entry = @diary.diary_drugs.build(diary_drug_params)
    respond_to do |format|
      if @entry.save
        format.html
        format.json { render json: @entry}
      else
        format.html
        format.json { render json: @entry}
      end
    end
  end

  private

  def set_diary
    @diary = Diary.find(session[:diary_id])
  end

  def set_prescription
    @prescription = @diary.prescription
  end

end

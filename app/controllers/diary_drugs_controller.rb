class DiaryDrugsController < ApplicationController
  before_action :set_diary, only: [:create, :update]
  before_action :set_prescription, only: [:create, :update]
  before_action :set_drug, only: [:create, :update]
  before_action :set_diary_drug, only: [:update]

  def create
    @diary_drug = @diary.diary_drugs.build(diary_drug_params)
    respond_to do |format|
      if @diary_drug.save
        puts "SUCCESS looking for: drug-form-#{@diary_drug.drug.id}"
        format.html {}
        format.js {}
      else
        puts "ERROR looking for: drug-form-#{@diary_drug.drug.id}"
        puts "!!! @diary_drug.errors: #{@diary_drug.errors.messages}"
        format.html {}
        format.js {}
      end
    end
  end

  def update
    respond_to do |format|
      if @diary_drug.update(diary_drug_params)
        format.html
        format.js {}
      else
        puts "!!! @diary_drug.errors: #{@diary_drug.errors.messages}"
        format.html
        format.js {}
      end
    end
  end

  private

  # FIXME - add resque statements to these finds and return an error
  def set_diary
    @diary = current_user.diaries.find(session[:diary_id])
  end

  def set_prescription
    @prescription = @diary.prescription
  end

  def set_drug
    @drug = @prescription.drugs.find(diary_drug_params[:drug_id])
  end

  def set_diary_drug
    @diary_drug = @diary.diary_drugs.find(params[:id])
  end

  def diary_drug_params
    params.require(:diary_drug).permit(:result, :comments, :date, :diary_id, :drug_id)
  end

end

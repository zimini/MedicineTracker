class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def new
    @diary = current_user.diaries.build
    @prescriptions = current_user.prescriptions
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    @prescription = current_user.prescriptions.where(diary_params[:prescription_ids]).first
    if @diary.save
      @diary.prescriptions << @prescription if @prescription
      flash[:notice] = 'Diary created successfully'
      redirect_to @diary
    else
      flash.now[:alert] = 'Diary was not created'
      # FIXME - this query is just to get the tests to pass:
      @prescriptions = current_user.prescriptions
      render :new
    end
  end

  def show
    @prescription = @diary.prescriptions.first
  end

  def index
    @diaries = current_user.diaries.all
  end

  def edit
    @prescriptions = current_user.prescriptions
  end

  def update
    if @diary.update(diary_params)
      @prescription = current_user.prescriptions.where(id: diary_params[:prescription_ids]).first
      @diary.prescription_ids = @prescription.id if @prescription
      flash[:notice] = 'Diary updated successfully'
      redirect_to @diary
    else
      flash.now[:alert] = 'Diary was not updated'
      # FIXME - this query is just to get the tests to pass:
      @prescriptions = current_user.prescriptions
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      flash[:notice] = "Diary successfully deleted"
      redirect_to diaries_path
    else
      flash[:alert] = "Diary not deleted"
      redirect_to @diary
    end
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :description, :prescription_ids)
  end

end

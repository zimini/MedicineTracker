class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_prescription, only: [:show]

  def new
    @diary = current_user.diaries.build
    @prescriptions = current_user.prescriptions
  end

  def create
    @diary = current_user.diaries.build(title: diary_params[:title], description: diary_params[:description])
    @prescription = current_user.prescriptions.where(id: diary_params[:prescription]).first
    if @diary.save
      @diary.prescription = @prescription if @prescription
      flash[:success] = 'Diary created successfully'
      redirect_to @diary
    else
      flash.now[:alert] = 'Diary was not created'
      # FIXME - this query is just to get the tests to pass:
      @prescriptions = current_user.prescriptions
      render :new
    end
  end

  def show
    set_todays_date
    if @prescription
      @drugs = @prescription.drugs
      @entries = []
      @drugs.each do |drug|
        @entries << DiaryDrug.find_or_initialize_by(diary: @diary, drug: drug, date: @today.to_s(:db))
      end
    end
  end

  def index
    @diaries = current_user.diaries.all
  end

  def edit
    @prescriptions = current_user.prescriptions
  end

  def update
    @prescription = current_user.prescriptions.where(id: diary_params[:prescription]).first
    if @diary.update(title: diary_params[:title], description: diary_params[:description])
      @diary.prescription = @prescription if @prescription
      flash[:success] = 'Diary updated successfully'
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
      flash[:success] = "Diary successfully deleted"
      redirect_to diaries_path
    else
      flash[:alert] = "Diary not deleted"
      redirect_to @diary
    end
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
    session[:diary_id] = @diary.id
  rescue ActiveRecord::RecordNotFound => e
    flash[:alert] = 'The diary you were looking for could not be found'
    redirect_to diaries_path
  end

  def set_prescription
    @prescription = @diary.prescription
  end

  def set_todays_date
    if params[:date].nil?
      @today = Date.today
    else
      @today = Date.parse(params[:date])
    end
    session[:date] = @today
  end

  def diary_params
    params.require(:diary).permit(:title, :description, :prescription)
  end

end

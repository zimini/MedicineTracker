class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def new
    # @diary = Diary.new
    @diary = current_user.diaries.build
  end

  def create
    # @diary = Diary.new(diary_params)
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      flash[:notice] = 'Diary created successfully'
      redirect_to @diary
    else
      flash.now[:alert] = 'Diary was not created'
      render :new
    end
  end

  def show
  end

  def index
    # FIXME - scope the query to the current_user
    @diaries = Diary.all
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      flash[:notice] = 'Diary updated successfully'
      redirect_to @diary
    else
      flash.now[:alert] = 'Diary was not updated'
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      flash[:notice] = "Diary successfully deleted"
      redirect_to diaries_path
    else
      flash[:alert] = "Diary not deleted"
      # render :edit
      redirect_to @diary
    end
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :description)
  end

end

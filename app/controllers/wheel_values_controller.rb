class WheelValuesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile, only: %i[new create destroy]
  before_action :is_my_profile_or_student, only: %i[show index]

  def index
    @user = User.find(params[:user_id])
    @wheel_values = @user.wheel_values.order(created_at: :desc)
    @wheel_model_options = WheelModel.all.map { |u| [u.name, u.id] }
  end

  def show
    @user = User.find(params[:user_id])
    @wheel_value = @user.wheel_values.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json do
        render json: [@wheel_value, @wheel_value.wheel_model]
      end
    end
  end

  def new
    @user = User.find(params[:user_id])
    @wheel_model = WheelModel.find(params[:wheel_model_id])
    @wheel_value = @user.wheel_values.new(
      wheel_model: @wheel_model
    )
  end

  def create
    @user = User.find(params[:user_id])
    @wheel_model = WheelModel.find(params[:wheel_model_id])
    @wheel_value = @user.wheel_values.new(wheel_value_params)

    if @wheel_value.save
      flash[:success] = 'Votre roue de la vie a été créée avec succès !'
      redirect_to user_wheel_values_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @wheel_value = @user.wheel_values.find(params[:id])
    if @wheel_value.destroy
      flash[:success] = 'Votre roue de la vie a été supprimée avec succès !'
    else
      flash[:danger] = 'Une erreur est survenue'
    end
    redirect_to user_wheel_values_path(@user)
  end

  private

  def wheel_value_params
    params.permit(:wheel_model_id, :user_id, comments: [], goal_values: [], current_values: [])
  end

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end

  def is_my_profile_or_student
    @coach_view = current_user.coach_of?(User.find(params[:user_id]))
    unless current_user == User.find(params[:user_id]) || @coach_view
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end

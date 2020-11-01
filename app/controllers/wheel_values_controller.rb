class WheelValuesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

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
    @wheel_value = @user.wheel_values.new(wheel_value_params)

    if @wheel_value.save
      flash[:success] = 'Votre roue de la vie a été créée avec succès !'
      redirect_to :index
    else
      render :new
    end
  end

  private

  def wheel_value_params
    params.require(:wheel_value).permit(:wheel_model_id, :current_values, :goal_values, :comments)
  end

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end

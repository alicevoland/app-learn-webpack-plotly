class WheelValuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @wheel_values = @user.wheel_values.order(created_at: :desc)
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
end

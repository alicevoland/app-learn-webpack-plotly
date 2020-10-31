class WheelModelsController < ApplicationController
  def index
    @wheel_models = WheelModel.all
  end

  def show
    @wheel_model = WheelModel.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json do
        render json: @wheel_model
      end
    end
  end
end

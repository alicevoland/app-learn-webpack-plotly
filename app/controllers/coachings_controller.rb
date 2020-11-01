class CoachingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def index
    @user = User.find(params[:user_id])
    @coach_coachings = @user.coach_coachings
    @student_coachings = @user.student_coachings
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end

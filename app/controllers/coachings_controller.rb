class CoachingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def index
    @user = User.find(params[:user_id])
    @coaches = @user.coaches
    @students = @user.students
  end

  def show
    @user = User.find(params[:user_id])
    @coaching = Coaching.find(params[:id])
    @student = @coaching.student
    @coach = @coaching.coach
    unless @user == @student || @user == @coach
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end

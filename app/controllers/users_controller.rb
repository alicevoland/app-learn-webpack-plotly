class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_profile_or_student, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def is_my_profile_or_student
    @coach_view = current_user.coach_of?(User.find(params[:id]))
    unless current_user == User.find(params[:id]) || @coach_view
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end

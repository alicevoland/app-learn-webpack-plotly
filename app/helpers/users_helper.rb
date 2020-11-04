module UsersHelper
  def student_view?
    user_signed_in? && current_user == User.find(params[:id])
  end

  def coach_view?
    user_signed_in? && !Coaching.find_by(coach_id: current_user.id, student_id: params[:id]).nil?
  end
end

class Coaching < ApplicationRecord
  belongs_to :coach, class_name: :User, foreign_key: :coach_id
  belongs_to :student, class_name: :User, foreign_key: :student_id

  validate :can_add_coach

  private

  def can_add_coach
    return unless coach && student

    errors.add(:coach, 'Vous ne pouvez pas vous coacher vous même') if coach == student
    errors.add(:coach, "C'est déjà votre coach !") if coach.coach_of?(student)
  end
end

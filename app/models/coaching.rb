class Coaching < ApplicationRecord
  belongs_to :coach, class_name: :User, foreign_key: :coach_id
  belongs_to :student, class_name: :User, foreign_key: :student_id
end

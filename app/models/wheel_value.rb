class WheelValue < ApplicationRecord
  belongs_to :wheel_model
  belongs_to :user

  validates :wheel_model, presence: true
  validates :user, presence: true
  validates :current_values, presence: true
  validates :goal_values, presence: true

  validate :values_size
  validate :higher_objective

  private

  def values_size
    return unless wheel_model && current_values && goal_values

    unless current_values.size == wheel_model.labels.size
      errors.add(:current_values, 'Le nombre de valeurs doit correspondre au modèle')
    end
    unless goal_values.size == wheel_model.labels.size
      errors.add(:goal_values, 'Le nombre de valeurs doit correspondre au modèle')
    end
  end

  def higher_objective
    unless wheel_model && current_values && goal_values && current_values.size == wheel_model.labels.size && goal_values.size == wheel_model.labels.size
      return
    end

    wheel_model.labels.each_with_index do |label, index|
      if goal_values[index] < current_values[index]
        errors.add(:goal_values, "L'objectif pour #{label} doit être supérieur à la valeur actuelle")
      end
    end
  end
end

class WheelValue < ApplicationRecord
  belongs_to :wheel_model
  belongs_to :user
end

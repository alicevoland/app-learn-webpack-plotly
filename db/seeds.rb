# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
WheelModel.destroy_all
WheelValue.destroy_all

ewen_user = User.create(email: 'ewencoach@yopmail.com', password: 'ewencoach')
mat_user = User.create(email: 'matuser@yopmail.com', password: 'matuser')

standard_wheel_model = WheelModel.create(
  name: 'Standard',
  description: 'Simple Wheel Of Life',
  labels: %w[A B C],
  maximum: 5
)

test_wheel_value = WheelValue.create(
  wheel_model: standard_wheel_model,
  user: mat_user,
  values: [3, 1, 2],
  comments: %w[Aa Bb Cc]
)

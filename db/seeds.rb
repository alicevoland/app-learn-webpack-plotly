# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coaching.destroy_all
User.destroy_all
WheelModel.destroy_all
WheelValue.destroy_all
puts 'DB cleaned up'

ewen_user = User.create(email: 'ewencoach@yopmail.com', password: 'ewencoach')
puts "Created user: #{ewen_user.email}"

mat_user = User.create(email: 'matuser@yopmail.com', password: 'matuser')
puts "Created user: #{mat_user.email}"

standard_wheel_model = WheelModel.create(
  name: 'Standard',
  description: 'Modèle standard de la roue de la vie',
  labels: ['Finances', 'Carrière', 'Environnement', 'Loisirs', 'Développement personnel', 'Conjoint / Couple', 'Amis / Famille', 'Santé / Vitalité'],
  maximum: 5
)
puts "Created WheelModel: #{standard_wheel_model.name}"

test_wheel_model = WheelModel.create(
  name: 'Test',
  description: 'Modèle TEST de la roue de la vie',
  labels: ['TEST axis 1', 'TEST axis 2', 'TEST axis 3', 'TEST axis 4'],
  maximum: 5
)
puts "Created WheelModel: #{test_wheel_model.name}"

test_wheel_value = WheelValue.create(
  wheel_model: standard_wheel_model,
  user: mat_user,
  current_values: [3, 1, 2, 1, 2, 1, 2, 1],
  goal_values: [3, 4, 5, 2, 2, 3, 4, 4],
  comments: %w[Aa Bb Cc Bb Cc Bb Cc Bb]
)
puts "Created WheelValue: for user #{test_wheel_value.user.email} with model #{test_wheel_value.wheel_model.name}"

coaching = Coaching.create(
  coach: ewen_user,
  student: mat_user
)
puts "Created Coaching, student is #{mat_user.email}, and coach is #{ewen_user.email}"

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
  description: 'Modèle standard de la roue de la vie',
  labels: ['Finances', 'Carrière', 'Environnement', 'Loisirs', 'Développement personnel', 'Conjoint / Couple', 'Amis / Famille', 'Santé / Vitalité', 'Finances'],
  maximum: 5
)

test_wheel_model = WheelModel.create(
  name: 'Test',
  description: 'Modèle TEST de la roue de la vie',
  labels: ['TEST axis 1', 'TEST axis 2', 'TEST axis 3', 'TEST axis 4', 'TEST axis 1'],
  maximum: 5
)

test_wheel_value = WheelValue.create(
  wheel_model: standard_wheel_model,
  user: mat_user,
  values: [3, 1, 2, 1, 2, 1, 2, 1, 3],
  comments: %w[Aa Bb Cc Bb Cc Bb Cc Bb Cc]
)

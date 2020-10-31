class CreateWheelValues < ActiveRecord::Migration[6.0]
  def change
    create_table :wheel_values do |t|
      t.belongs_to :wheel_model
      t.belongs_to :user

      t.integer :current_values, array: true, default: []
      t.integer :goal_values, array: true, default: []
      t.string :comments, array: true, default: []

      t.timestamps
    end
  end
end

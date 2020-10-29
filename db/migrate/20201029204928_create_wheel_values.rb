class CreateWheelValues < ActiveRecord::Migration[6.0]
  def change
    create_table :wheel_values do |t|
      t.belongs_to :wheel_model
      t.belongs_to :user

      t.integer :values, array: true, default: []
      t.string :comments, array: true, default: []

      t.timestamps
    end
  end
end

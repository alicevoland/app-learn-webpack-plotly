class CreateWheelModels < ActiveRecord::Migration[6.0]
  def change
    create_table :wheel_models do |t|
      t.string :name, unique: true
      t.text :description
      t.string :labels, array: true, default: []
      t.integer :maximum

      t.timestamps
    end
  end
end

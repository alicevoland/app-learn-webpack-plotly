class CreateCoachings < ActiveRecord::Migration[6.0]
  def change
    create_table :coachings do |t|
      t.timestamps
    end
    add_reference :coachings, :coach, foreign_key: { to_table: :users }
    add_reference :coachings, :student, foreign_key: { to_table: :users }
  end
end

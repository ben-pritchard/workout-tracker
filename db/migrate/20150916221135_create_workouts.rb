class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.column :workout, :text
      t.column :notes, :text
      t.column :date, :date

      t.timestamps
    end
  end
end

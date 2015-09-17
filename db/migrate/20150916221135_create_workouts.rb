class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.column :workout, :string
      t.column :notes, :string
      t.column :date, :date

      t.timestamps
    end
  end
end

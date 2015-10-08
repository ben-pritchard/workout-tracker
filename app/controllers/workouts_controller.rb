class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def edit
    @workouts = Workout.all
    respond_to do |format|
      format.html
      format.js
    end
    render :index
  end
end

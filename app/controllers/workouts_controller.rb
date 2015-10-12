class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.order(date: :desc)
  end

  def edit
    @workout = Workout.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      respond_to do |format|
        format.html { redirect_to workouts_path }
        format.js
      end
    else
      # flash[:alert] = "An error occurred."
      render :index
    end
  end

private
  def workout_params
    params.require(:workout).permit(:date, :body, :notes)
  end
end

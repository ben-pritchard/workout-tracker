class Workout < ActiveRecord::Base
  validates :date, presence: true
end

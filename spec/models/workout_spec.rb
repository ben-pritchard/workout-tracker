require 'rails_helper'

describe Workout do
  it { should validate_presence_of :date }
end

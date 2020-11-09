class PatientsController < ApplicationController

  def index
    @patients = Patient.ordered_by_age
  end

end

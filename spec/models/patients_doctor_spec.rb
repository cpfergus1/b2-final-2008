require 'rails_helper'

RSpec.describe PatientsDoctor, type: :model do
  describe "Relations" do
    it {should belong_to(:doctor)}
    it {should belong_to(:patient)}
  end
end

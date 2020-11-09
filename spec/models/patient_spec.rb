require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "Relations" do
    it {should have_many(:doctors).through(:patients_doctors)}
  end
end

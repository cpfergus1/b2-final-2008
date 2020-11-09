require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "Relations" do
    it {should have_many(:doctors).through(:patients_doctors)}
  end

  describe 'class methods' do
    before :each do
      @patient_1 = Patient.create!(name: 'Katie Bryce',
                                    age: 24)
      @patient_2 = Patient.create!(name: 'Denny Duquette',
                                    age: 39)
      @patient_3 = Patient.create!(name: 'Rebecca Pope',
                                    age: 32)
    end
    it '.ordered_by_age' do
      expect(Patient.ordered_by_age.first).to eq(@patient_2)
      expect(Patient.ordered_by_age.second).to eq(@patient_3)
      expect(Patient.ordered_by_age.last).to eq(@patient_1)
    end
  end
end

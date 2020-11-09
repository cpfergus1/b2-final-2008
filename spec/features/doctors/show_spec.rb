require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
    @doctor = @hospital.doctors.create!(name: 'Meredeth Grey',
                                        specialty: 'General Surgery Education',
                                        education: 'Harvard University')
    @patient_1 = Patient.create!(name: 'Katie Bryce',
                                  age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette',
                                  age: 39)
    @patient_3 = Patient.create!(name: 'Rebecca Pope',
                                  age: 32)
    @doctor.patients << @patient_1
    @doctor.patients << @patient_2
    @doctor.patients << @patient_3
  end
  describe 'I visit the doctors show page and' do
    it 'see name, specialty, and university' do
      visit "/doctors/#{doctor.id}"
      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.university)
    end

    it 'I see the hospital the doctor belongs to' do
      visit "/doctors/#{doctor.id}"
      expect(page).to have_content(@doctor.hospital)
    end

    it 'I see all the patients the doctor is seeing' do
      expect(page).to have_content(@patient_1.name)
      expect(page).to have_content(@patient_1.age)
      expect(page).to have_content(@patient_2.name)
      expect(page).to have_content(@patient_2.age)
      expect(page).to have_content(@patient_3.name)
      expect(page).to have_content(@patient_3.age)
    end
  end
end

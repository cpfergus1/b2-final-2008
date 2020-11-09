require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "Relations" do
    it {should have_many(:patients).through(:patients_doctors)}
    it {should belong_to(:hospital)}
  end

  describe 'class methods' do
    before :each do
      @hospital = Hospital.create!(name: 'Grey Sloan Memorial Hospital')

      @doctor1 = @hospital.doctors.create!(name: 'Meredeth Grey',
                                          specialty: 'General Surgery Education',
                                          education: 'Harvard University')

      @doctor2 = @hospital.doctors.create!(name: 'Alex Karev',
                                          specialty: 'Pediatric Surgery',
                                          education: 'John Hopkins University')

      @doctor3 = @hospital.doctors.create!(name: 'Miranda Bailey',
                                          specialty: 'General Surgery Education',
                                          education: 'Stanford University')

      @doctor4 = @hospital.doctors.create!(name: 'Derek McDreamy Shepherd',
                                          specialty: 'Attending Surgeon',
                                          education: 'University of Pennsylvania')

      @doctor5 = @hospital.doctors.create!(name: 'Mega Doctor',
                                          specialty: 'Super Surgeon',
                                          education: 'Harvard University')
    end

    it '.unique_universities' do
      expected = ["University of Pennsylvania", "Harvard University", "Stanford University", "John Hopkins University"]
      expect(Doctor.unique_universities).to eq(expected)
    end
  end
end

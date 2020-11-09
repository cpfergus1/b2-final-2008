require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe "Relations" do
    it {should have_many(:doctors)}
  end

  describe "instance methods" do
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
    it ".doctors_count" do
      expect(@hospital.doctors_count).to eq(5)
    end
  end
end

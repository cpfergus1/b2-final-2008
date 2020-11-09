require 'rails_helper'

describe 'As a visitor' do
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
  describe 'when I visit a hospitals show page' do
    it 'I see the hospital name' do
      visit hospital_path(@hospital.id)
      expect(page).to have_content(@hospital.name)
    end

    it 'I see the number of doctors that work at the hospital' do
      visit hospital_path(@hospital.id)
      within("#doctors-count") do
        expect(page).to have_content(@hospital.doctors.count)
      end
    end

    it 'I see a unique list of universities that the doctors have attended' do
      visit hospital_path(@hospital.id)
      within("#university-list")
        expect(page).to have_content(@doctor1.education)
        expect(page).to have_content(@doctor2.education)
        expect(page).to have_content(@doctor3.education)
        expect(page).to have_content(@doctor4.education)
    end
  end
end

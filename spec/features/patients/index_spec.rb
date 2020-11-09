require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @patient_1 = Patient.create!(name: 'Katie Bryce',
                                  age: 24)
    @patient_2 = Patient.create!(name: 'Denny Duquette',
                                  age: 39)
    @patient_3 = Patient.create!(name: 'Rebecca Pope',
                                  age: 32)
  end
  describe 'when I visit the patient index page' do
    it 'I see the names of all the patients listed from oldest to yougest' do
      visit patients_path
      expect(page.all('li')[0]).to have_content("#{@patient_2.name}, #{@patient_2.age}")
      expect(page.all('li')[1]).to have_content("#{@patient_3.name}, #{@patient_3.age}")
      expect(page.all('li')[2]).to have_content("#{@patient_1.name}, #{@patient_1.age}")
    end
  end
end

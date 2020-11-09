require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "Relations" do
    it {should have_many(:patients).through(:patients_doctors)}
    it {should belong_to(:hospital)}
  end
end

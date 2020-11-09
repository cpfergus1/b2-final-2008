class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_count
    doctors.count
  end
end

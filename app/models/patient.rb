class Patient < ApplicationRecord
  has_many :patients_doctors
  has_many :doctors, through: :patients_doctors

  def self.ordered_by_age
    order(age: :desc)
  end
end

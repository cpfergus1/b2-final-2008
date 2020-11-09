class Patient < ApplicationRecord
  has_many :patients_doctors
  has_many :doctors, through: :patients_doctors
end

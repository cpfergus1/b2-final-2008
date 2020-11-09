class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patients_doctors
  has_many :patients, through: :patients_doctors

  def self.unique_universities
    distinct('education').pluck('education')
  end
end

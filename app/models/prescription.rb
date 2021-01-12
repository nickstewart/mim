class Prescription < ApplicationRecord
  validates :name, presence: true
end

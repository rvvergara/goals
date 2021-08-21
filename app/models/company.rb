class Company < ApplicationRecord
  has_many :departments
  has_many :zones, through: :departments
end

class Schoolclass < ApplicationRecord
  belongs_to :user
  #belongs_to :student
  
  validates :note, length: { maximum: 500 }
end

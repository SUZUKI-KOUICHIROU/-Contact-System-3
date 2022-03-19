class Schoolclass < ApplicationRecord
  belongs_to :user
  
  
  validates :note, length: { maximum: 500 }
end

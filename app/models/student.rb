class Student < ApplicationRecord
  belongs_to :user
  
  validates :birthday, presence: true
  validates :student_number, uniqueness: true, length: { maximum: 2 }
end

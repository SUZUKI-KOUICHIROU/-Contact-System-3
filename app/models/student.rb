class Student < ApplicationRecord
  belongs_to :user
  
  validates :birthday, presence: true  
end

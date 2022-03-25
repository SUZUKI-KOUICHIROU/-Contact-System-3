class ClassNumber < ApplicationRecord
  
  validates :class_name, uniqueness: true
end

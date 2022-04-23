class Schoolclass < ApplicationRecord
  belongs_to :user

  validates :class_name, uniqueness: true
  validates :note, length: { maximum: 500 }
end

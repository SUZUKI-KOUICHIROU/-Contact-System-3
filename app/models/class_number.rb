class ClassNumber < ApplicationRecord
  belongs_to :user

  validates :class_name, uniqueness: true
end

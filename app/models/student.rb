class Student < ApplicationRecord
  belongs_to :user
  #has_many :schoolclasses, dependent: :destroy
end

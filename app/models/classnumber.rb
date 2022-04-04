class Classnumber < ApplicationRecord
  belongs_to :user 
  validates :class_name, uniqueness: true
end

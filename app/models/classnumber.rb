class Classnumber < ApplicationRecord
  validates :class_name, uniqueness: true
end

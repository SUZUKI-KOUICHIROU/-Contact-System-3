class Classnumber < ApplicationRecord
  validates :class_name, uniqueness: true, length: { maximum: 3 }
end

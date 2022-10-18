class Student < ApplicationRecord
  belongs_to :user
  
  validates :birthday, presence: true
  validates :student_number, allow_blank: true, numericality: {only_integer: true}, length: { maximum: 2 }


  def self.search(keyword)
    where(["student_name like?", "%#{keyword}%"])
  end
end

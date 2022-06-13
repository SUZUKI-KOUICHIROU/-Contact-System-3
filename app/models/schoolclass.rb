class Schoolclass < ApplicationRecord
  belongs_to :user
  
  validates :title, length: { maximum: 30 }
  validates :teacher_note, length: { maximum: 1000 }
  validates :guardian_note_4, length: { maximum: 1000 }
  validates :title_2, length: { maximum: 30 }
  validates :teacher_note_2, length: { maximum: 1000 }
  validates :school_contact, length: { maximum: 1000 }
  validates :title_3, length: { maximum: 30 }
  validates :guardian_note_1, length: { maximum: 1000 }
  validates :title_4, length: { maximum: 30 }
  validates :guardian_note_3, length: { maximum: 1000 }
  validates :guardian_note_2, length: { maximum: 1000 }
  validates :board_title, length: { maximum: 30 }
  validates :contact_board, length: { maximum: 1000 }
  validates :note, length: { maximum: 1000 }
end

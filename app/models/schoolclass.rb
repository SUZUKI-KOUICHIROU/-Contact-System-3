class Schoolclass < ApplicationRecord
  belongs_to :user

  enum board_select: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select2: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select3: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select4: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select5: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select6: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select7: { 投稿: 0, 削除: 1 }, _prefix: true
  enum contact_select8: { 投稿: 0, 削除: 1 }, _prefix: true

  
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

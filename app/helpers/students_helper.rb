module StudentsHelper

  def student_birthday(today, birthday)
    birthday = @student.birthday 
    (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
end
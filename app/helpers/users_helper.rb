module UsersHelper
  def student_birthday(today, birthday)
    birthday = @user.birthday 
    (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
end

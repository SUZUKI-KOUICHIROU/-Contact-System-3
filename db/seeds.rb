# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# coding: utf-8

User.create!(name: "管理者1",
  email: "admin-1@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)
  
User.create!(name: "担任1",
  email: "teacher-1@email.com",
  class_number: "1-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)
  
User.create!(name: "担任2",
  email: "teacher-2@email.com",
  class_number: "1-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)
  
User.create!(name: "担任3",
  email: "teacher-3@email.com",
  class_number: "1-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)
  
User.create!(name: "担任4",
  email: "teacher-4@email.com",
  class_number: "2-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)
    
User.create!(name: "担任5",
  email: "teacher-5@email.com",
  class_number: "2-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)
      
User.create!(name: "担任6",
  email: "teacher-6@email.com",
  class_number: "2-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任7",
  email: "teacher-7@email.com",
  class_number: "3-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)
  
User.create!(name: "担任8",
  email: "teacher-8@email.com",
  class_number: "3-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任9",
  email: "teacher-9@email.com",
  class_number: "3-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任10",
  email: "teacher-10@email.com",
  class_number: "4-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任11",
  email: "teacher-11@email.com",
  class_number: "4-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任12",
  email: "teacher-12@email.com",
  class_number: "4-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任13",
  email: "teacher-13@email.com",
  class_number: "5-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任14",
  email: "teacher-14@email.com",
  class_number: "5-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任15",
  email: "teacher-15@email.com",
  class_number: "5-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任16",
  email: "teacher-16@email.com",
  class_number: "6-1",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任17",
  email: "teacher-17@email.com",
  class_number: "6-2",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "担任18",
  email: "teacher-18@email.com",
  class_number: "6-3",
  password: "password",
  password_confirmation: "password",
  teacher: true)

User.create!(name: "保護者1",
  email: "sample-1@email.com",
  post_code: 1112222,
  address: "渋谷区恵比寿1-1-1-608",
  telephone_number: "09012345678",
  password: "password",
  password_confirmation: "password")

User.create!(name: "保護者2",
  email: "sample-2@email.com",
  post_code: 2223333,
  address: "千代田区飯田橋1-1-1-708",
  telephone_number: "08012345678",
  password: "password",
  password_confirmation: "password")

Student.create!(student_name: "生徒1",
  user_id: 20,
  birthday: Date.new(2015, 5, 12), 
  class_belongs: "1-1",
  student_number: 1)

Student.create!(student_name: "生徒2",
  user_id: 21,
  birthday: Date.new(2015, 11, 5), 
  class_belongs: "2-1",
  student_number: 1)

Classnumber.create!(class_name: "1-1")
Classnumber.create!(class_name: "1-2")
Classnumber.create!(class_name: "1-3")
Classnumber.create!(class_name: "2-1")
Classnumber.create!(class_name: "2-2")
Classnumber.create!(class_name: "2-3")
Classnumber.create!(class_name: "3-1")
Classnumber.create!(class_name: "3-2")
Classnumber.create!(class_name: "3-3")
Classnumber.create!(class_name: "4-1")
Classnumber.create!(class_name: "4-2")
Classnumber.create!(class_name: "4-3")
Classnumber.create!(class_name: "5-1")
Classnumber.create!(class_name: "5-2")
Classnumber.create!(class_name: "5-3")
Classnumber.create!(class_name: "6-1")
Classnumber.create!(class_name: "6-2")
Classnumber.create!(class_name: "6-3")
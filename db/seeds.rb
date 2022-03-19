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

User.create!(name: "管理者2",
  email: "admin-2@email.com",
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

4.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end
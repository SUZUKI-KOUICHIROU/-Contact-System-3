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
  

  

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all


users = User.create!([
  {name: 'Anna', password: '1'},
  {name: 'Mark', password: '2'},
  {name: 'Max', password: '3'}
  ])


categories = Category.create!([
  {title: 'Backend'},
  {title: 'Frontend'},
  {title: 'Mobile'}
])


tests = Test.create!([
  {title: 'Ruby', category: categories[0], author: users[0], level: '1'},
  {title: 'JavaScript', category: categories[1], author: users[1], level: '1'},
  {title: 'Swift', category: categories[2], author: users[2], level: '1'}
])


questions = Qustion.create!([
  {body: 'Когда появился язык программирования Ruby?',test: tests[0]},
  {body: 'Когда появился язык программирования JavaScript?',test: tests[1]},
  {body: 'Когда появился язык программирования Swift?',test: tests[2]}
])


user_tests = UserTest.create!([
{user: users[0],test: tests[0]},
{user: users[1],test: tests[1]},
{user: users[2],test: tests[1]}
])

# answers = Answer.create!([
#   {title: '1995', correct: true, question: questions[0]},
#   {title: '1996', correct: false, question: questions[0]},
#   {title: '1995', correct: true, question: questions[1]},
#   {title: '1998', correct: false, question: questions[1]},
#   {title: '2014', correct: true, question: questions[2]},
#   {title: '2013', correct: false, question: questions[2]}
# ])

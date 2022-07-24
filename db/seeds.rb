# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Answer.destroy_all
Qustion.destroy_all
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
  {title: 'Ruby', category_id: categories[0], author_id: user[0], level: '1'},
  {title: 'JavaScript', category_id: categories[1], author_id: user[1], level: '1'},
  {title: 'Swift', category_id: categories[2], author_id: user[2], level: '1'}
])


questions = Qustion.create!([
  {body: 'Когда появился язык программирования Ruby?',test_id: tests[0]},
  {body: 'Когда появился язык программирования JavaScript?',test_id: tests[1]},
  {body: 'Когда появился язык программирования Swift?',test_id: tests[2]}
])

answers = Answer.create!([
  {title: '1995', correct: true, question_id: questions[0]},
  {title: '1996', correct: false, question_id: questions[0]},
  {title: '1995', correct: true, question_id: questions[1]},
  {title: '1998', correct: false, question_id: questions[1]},
  {title: '2014', correct: true, question_id: questions[2]},
  {title: '2013', correct: false, question_id: questions[2]}
])

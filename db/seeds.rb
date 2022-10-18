TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Mobile Dev' },
  { title: 'Machine Learning' },
  { title: 'Sports' }
])

users = User.create!([
  { name: 'Steve Ballmer'},
  { name: 'Paul Allen'},
  { name: 'Bill Gates'}
])

tests = Test.create!([
  { title: 'Ruby', category: categories[0], level: 3, author: users[1] },
  { title: 'JS', category: categories[0], level: 3, author: users[1] },
  { title: 'Java', category: categories[1], level: 6, author: users[2] },
  { title: 'Basketball', category: categories[4], level: 1, author: users[0] }
])

questions = Question.create!([
  { body: 'How to create empty hash in Ruby?', test: tests[0] },
  { body: 'How to install Rubocop?', test: tests[0] },
  { body: 'How many teams are there in the NBA?', test: tests[3] },
  { body: 'How many games are threr in an NBA season?', test: tests[3] }
])

answers = Answer.create!([
  { title: 'Just type = {}', question: questions[0], correct: true },
  { title: 'Just type = []', question: questions[0] },
  { title: 'Just type = CREATE_EMPTY_HASH', question: questions[0] },
  { title: 'Just type = HASH_ME!', question: questions[0] },
  { title: 'gem install rubocop', question: questions[1], correct: true },
  { title: 'pip install rubocop', question: questions[1] },
  { title: 'sudo ustanovka rubocopa', question: questions[1] },
  { title: 'install_rubocop', question: questions[1] },
  { title: '30', question: questions[2], correct: true },
  { title: '32', question: questions[2] },
  { title: '16', question: questions[2] },
  { title: '7', question: questions[2] },
  { title: '82', question: questions[3], correct: true },
  { title: '50', question: questions[3] },
  { title: '61', question: questions[3] },
  { title: '80', question: questions[3] }
])

results = TestPassage.create!([
  { user: users[0], test: tests[0], current_questions: questions[0], correct_questions: 1 },
  { user: users[1], test: tests[0], current_questions: questions[1], correct_questions: 0 },
  { user: users[2], test: tests[3], current_questions: questions[3], correct_questions: 1 }
])

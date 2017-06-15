# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Response.destroy_all
Question.destroy_all
AnswerChoice.destroy_all



User.create([{ user_name: 'Deirdre' }, { user_name: 'Nick' }, { user_name: 'Debra' }])
Poll.create(title: 'Name?', user_id: User.first.id)
Poll.create(title: 'Color?', user_id: User.second.id)

name_q1 = Question.create(question: 'What is your name?', poll_id: Poll.first.id)
name_q2 = Question.create(question: 'What is your friends name?', poll_id: Poll.first.id)

color_q1 = Question.create(question: 'What is your favorite color?', poll_id: Poll.second.id)
color_q2 = Question.create(question: 'What is your least favorite color?', poll_id: Poll.second.id)

nameq1_answers = AnswerChoice.create([{answer: 'Brian', question_id: name_q1.id}, {answer: 'Diana', question_id: name_q1.id}])
nameq2_answers = AnswerChoice.create([{answer: 'Brian', question_id: name_q2.id}, {answer: 'Diana', question_id: name_q2.id}])
colorq1_answers = AnswerChoice.create([{answer: 'Purple', question_id: color_q1.id}, {answer: 'Green', question_id: color_q1.id}])
colorq2_answers = AnswerChoice.create([{answer: 'Purple', question_id: color_q2.id}, {answer: 'Green', question_id: color_q2.id}])

nameq1_response = Response.create(user_id: User.first.id, answer_choice_id: nameq1_answers.first.id)
nameq2_response = Response.create(user_id: User.first.id, answer_choice_id: nameq2_answers.second.id)
nameq1_response2 = Response.create(user_id: User.second.id, answer_choice_id: nameq1_answers.second.id)

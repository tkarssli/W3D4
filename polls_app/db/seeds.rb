# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do


    User.destroy_all

    sam = User.create!(username: "Sam O'donnell")
    tamir = User.create!(username: "Tamir Karssli")

    Poll.destroy_all

    poll1 = Poll.create!(title: "Best Candy", author_id: sam.id)

    Question.destroy_all

    q1 = Question.create!(question_text: "Favorite candy bar", poll_id: poll1.id)
    q2 = Question.create!(question_text: "Favorite gummy", poll_id: poll1.id)

    AnswerChoice.destroy_all

    a1 = AnswerChoice.create!(answer_text: "Snickers", question_id: q1.id)
    a2 = AnswerChoice.create!(answer_text: "Three Musketeers", question_id: q1.id)
    a3 = AnswerChoice.create!(answer_text: "Clif Bar", question_id: q1.id)
    a4 = AnswerChoice.create!(answer_text: "Bears", question_id: q2.id)
    a5 = AnswerChoice.create!(answer_text: "Worms", question_id: q2.id)
    a6 = AnswerChoice.create!(answer_text: "Kids", question_id: q2.id)

    Response.destroy_all

    Response.create!(user_id: sam.id, answer_choice_id: a1.id)
    Response.create!(user_id: sam.id, answer_choice_id: a6.id)
    Response.create!(user_id: tamir.id, answer_choice_id: a1.id)
    Response.create!(user_id: tamir.id, answer_choice_id: a5.id)
    
end


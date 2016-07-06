u1 = User.create!(user_name: "Markov")
u2 = User.create!(user_name: "Gizmo")

p1 = Poll.create!(title: "Cats Poll", author_id: u1.id)

q1 = Question.create!(body: "What Cat Is Cutest?", poll_id: p1.id)
ac1 = AnswerChoice.create!(body: "Markov", question_id: q1.id)
ac2 = AnswerChoice.create!(body: "Curie", question_id: q1.id)
ac3 = AnswerChoice.create!(body: "Sally", question_id: q1.id)

q2 = Question.create!(body: "Which Toy Is Most Fun?", poll_id: p1.id)
ac4 = AnswerChoice.create!(body: "String", question_id: q2.id)
ac5 = AnswerChoice.create!(body: "Ball", question_id: q2.id)
ac6 = AnswerChoice.create!(body: "Bird", question_id: q2.id)

r1 = Response.create!(
  respondent_id: u2.id, answer_choice_id: ac3.id
)
r2 = Response.create!(
  respondent_id: u2.id, answer_choice_id: ac4.id
)

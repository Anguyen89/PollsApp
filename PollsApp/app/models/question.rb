class Question < ActiveRecord::Base
  validates :body, :poll_id, null: false

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: "Poll"

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: "AnswerChoice"

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    questions = self.answer_choices
    result = {}
    questions.each do |question|
      result[question] = question.responses.count
    end
    result
  end
end

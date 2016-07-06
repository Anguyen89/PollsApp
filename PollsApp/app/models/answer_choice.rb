class AnswerChoice < ActiveRecord::Base
  validates :question_id, :body, null: false

  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: "Question"

  has_many :responses,
    foreign_key: :answer_choices_id,
    primary_key: :id,
    class_name: "Response"
end

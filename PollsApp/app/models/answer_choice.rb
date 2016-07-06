class AnswerChoice < ActiveRecord::Base
  validates :question_id, :body, null: false
end

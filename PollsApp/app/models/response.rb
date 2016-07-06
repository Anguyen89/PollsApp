class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, null: false

  validate :respondent_has_not_already_answered
  validate :respondent_is_not_poll_author

  belongs_to :respondent,
    foreign_key: :respondent_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibbling_responses
    self.question.responses.where.not(id: self.id )
  end

  def respondent_has_not_already_answered
    if sibbling_responses.exists?(respondent_id: self.respondent_id)
      errors[:respondent_id] << "Cannot answer the question twice"
    end
  end

  def respondent_is_not_poll_author
    poll_author = self.answer_choice.question.poll.author_id

    if self.respondent_id == poll_author
      errors[:respondent_id] << "Author cannot respond to own question"
    end
  end


end

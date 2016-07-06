class Response < ActiveRecord::Base
  validates :respondent_id, :question_id, null: false
end

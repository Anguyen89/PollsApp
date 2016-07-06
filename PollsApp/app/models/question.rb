class Question < ActiveRecord::Base
  validates :body, :poll_id, null: false 
end

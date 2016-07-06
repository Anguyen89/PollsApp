class Poll < ActiveRecord::Base
  validates :title, :author_id, null: false
end

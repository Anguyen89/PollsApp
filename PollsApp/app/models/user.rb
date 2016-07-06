class User < ActiveRecord::Base
  validates :username, null: false, uniqueness: true
end

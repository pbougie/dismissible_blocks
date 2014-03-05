class User < ActiveRecord::Base
  serialize :dismissed_blocks, Array

  validates :username, uniqueness: true

  def self.authenticate(username, password)
    User.find_by username: username, password: password
  end
end

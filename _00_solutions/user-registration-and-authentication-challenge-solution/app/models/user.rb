class User < ApplicationRecord
  # Remember to create a migration!

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(arg)
    self.password_hash = BCrypt::Password.create(arg)
  end
end

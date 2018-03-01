class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :positions

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authentication(email, plaintext_password)
    return nil unless user = find_by(email: email)
    return user if user.password == plaintext_password
    return nil
  end

  def evaluations
    positions.map{|p| p.evaluations}.flatten
  end

end

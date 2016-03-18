class User < ActiveRecord::Base
  attr_accessor :remember_token
  #because our validation is case insensitive, our indeces should be too
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
has_secure_password
validates :password, presence: true, length: {minimum: 6}

#each user can have many itineraries
#make sure if user is deleted, itineraries are also
has_many :itineraries, dependent: :destroy

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

#Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

#Remembers a user in the database for use in persistent sessions
  def remember
    #because of the way Ruby handles assignments inside objects, without self
    #the assignment would create a local variable
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end

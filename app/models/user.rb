class User < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates_uniqueness_of :email, message: "email already exists"

  validates_length_of :password, :maximum => 25
  validates_length_of :password, :minimum => 5

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
     return user
    else
      return nil
    end
  end

end

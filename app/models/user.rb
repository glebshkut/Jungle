class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, :length => {:within => 8..Float::INFINITY}

  
  before_validation :change_to_lower_case


  private
    def change_to_lower_case
      self.email.downcase!
    end

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    user = User.find_by(email: email.strip)
    p user
    if user && user.authenticate(password)
      return user
    end
  end
end

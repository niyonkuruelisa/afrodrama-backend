class User < ApplicationRecord
  has_secure_password
  before_validation :set_uuid, on: :create

  validates :firstName,
            length: { minimum: 2 }

  validates :lastName,
            length: { minimum: 2 }

  VALIDATE_EMAIL_REGEX = /@/
  validates :email,
            format: { with: VALIDATE_EMAIL_REGEX, message: "Invalid email address"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
 /x

  validates :password_digest,
            length: { minimum: 4 },
            format: { with: PASSWORD_FORMAT }


  def set_uuid
    self.id = SecureRandom.uuid
  end
end

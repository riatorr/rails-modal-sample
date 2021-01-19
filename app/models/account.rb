class Account < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :login, presence: true, uniqueness: true
  validates :name, presence: true
end

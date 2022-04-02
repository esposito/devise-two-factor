require 'devise'
require 'devise_two_factor/models'
require 'devise_two_factor/strategies'

module Devise
  # The length of generated OTP secrets
  mattr_accessor :otp_secret_length
  @@otp_secret_length = 24

  # The number of seconds before and after the current
  # time for which codes will be accepted
  mattr_accessor :otp_allowed_drift
  @@otp_allowed_drift = 30

  # The key used to encrypt OTP secrets in the database in legacy installs.
  mattr_accessor :otp_secret_encryption_key
  @@otp_secret_encryption_key = nil

  # These options are passed to the Rails 7+ encrypted attribute
  mattr_accessor :otp_encrypted_attribute_options
  @@otp_encrypted_attribute_options = {}

  # The length of all generated OTP backup codes
  mattr_accessor :otp_backup_code_length
  @@otp_backup_code_length = 16

  # The number of backup codes generated by a call to
  # generate_otp_backup_codes!
  mattr_accessor :otp_number_of_backup_codes
  @@otp_number_of_backup_codes = 5
end

Devise.add_module(:two_factor_authenticatable, :route => :session, :strategy => true,
                  :controller => :sessions, :model  => true)

Devise.add_module(:two_factor_backupable, :route => :session, :strategy => true,
                  :controller => :sessions, :model  => true)

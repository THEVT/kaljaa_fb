# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  session_id      :string(255)
#  authorization   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  enabled         :integer          default(1)
#  ty              :string(255)
#  password_digest :string(255)
#

class Account < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation, :authorization, :ty
	has_secure_password  	

	before_save { |account| account.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
	validates :authorization, presence: true
	validates :ty, presence: true
end

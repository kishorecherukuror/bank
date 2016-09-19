class Account < ActiveRecord::Base
	belongs_to :user
	belongs_to :branch
	validates :account_number, presence: true
end

class Account < ApplicationRecord
	belongs_to :user
	belongs_to :branch
	has_many :transactions,dependent: :destroy
end

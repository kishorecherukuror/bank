class Account < ActiveRecord::Base
	belongs_to :user
	belongs_to :branch
	has_many :transactions, dependent: :destroy
end

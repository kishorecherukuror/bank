class Withdraw < ActiveRecord::Base
	belongs_to:user
	belongs_to: deposit
end

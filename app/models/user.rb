class User < ActiveRecord::Base

	validates :fname, presence: true
	validates :lname, presence: true
	#validate :at_least_18
	validates_inclusion_of :age, :in=>Date.new(1900)..Time.now.years_ago(18).to_date, :message=>'You must be 18 years or older'
end


def at_least_18

    if self.age
      errors.add(:age, 'You must be 18 years or older.') if self.age > 18.years.ago.to_date
    end
	has_many :accounts

end

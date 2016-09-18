class User < ActiveRecord::Base

	validates :fname, presence: true
	validates :lname, presence: true
	validates_length_of :password, minimum: 6
	validates_confirmation_of :password
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

	#validates :fname, presence: true
	#validates :lname, presence: true

	#validate :at_least_18
	has_many :accounts, dependent: :destroy
	before_save :encrypt_password
	attr_accessor  :password, :password_confirmation
	#validates_inclusion_of :age, :in=>Date.new(1900)..Time.now.years_ago(18).to_date, :message=>'You must be 18 years or older'
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" },
                  storage: :s3,
                  :s3_region => 'us-west-2',
                  s3_credentials: {access_key_id: 'AKIAIKBK7ZQDYZU4B2JQ', secret_access_key: '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' },
                  bucket: "elasticbeanstalk-us-west-2-910437440261"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	
	def self.authenticate(email, password)
	    user = find_by_email(email)
	    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	      user
	    else
	      nil
	    end
  	end

	def encrypt_password
	    if password.present?
	      self.password_salt = BCrypt::Engine.generate_salt
	      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
  	end
end




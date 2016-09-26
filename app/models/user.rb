class User < ActiveRecord::Base
	require 'csv'
	#validates :fname, presence: true
	#validates :lname, presence: true
	#validate :at_least_18
	has_many :accounts, dependent: :destroy
	has_many :transactions
	before_save :encrypt_password
	attr_accessor  :password, :password_confirmation
	#validates_inclusion_of :age, :in=>Date.new(1900)..Time.now.years_ago(18).to_date, :message=>'You must be 18 years or older'
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>" },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" },
                  storage: :s3,
                  :s3_region => 'us-west-2',
                  :s3_host_name => 's3-us-west-2.amazonaws.com',
                  s3_credentials: {access_key_id: 'AKIAIJRODG3ZJRYQLKAA', secret_access_key: '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' },
                  bucket: "elasticbeanstalk-us-west-2-910437440261"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	
	def self.to_csv
		attributes = %w{id fname lname ful_name}

		CSV.generate(headers: true) do |csv|
			csv << attributes
			all.each do |user|
        		csv << attributes.map{ |attr| user.send(attr) }
     		end
		end
	end

	def self.import(file)
		binding.pry
		CSV.foreach(file.path, headers: true) do |row|
			user_hash = row.to_hash
			user = User.where(id: user_hash["id"])

		      if user.count == 1
		        user.first.update_attributes(user_hash)
		      else
       		 	User.create!(user_hash)
     		  end # end if !product.nil?
		end
	end

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




class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  
  has_many :accounts
  before_save :encrypt_password
  #has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

has_attached_file :photo,
                  styles: { thumb: ["64x64#", :jpg],
                            original: ['500x500>', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" },
                  storage: :s3,
                  :s3_region => 'us-west-2',
                  :s3_host_name => 's3-us-west-2.amazonaws.com',
                  s3_credentials: {access_key_id: 'AKIAIF4LAZSEOBTDDBVQ', secret_access_key: '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'},
                  bucket: "anshumanbucket"

validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.authenticate(email, password)
    user = find_by_email(email)
    puts "**************" + user.to_s
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

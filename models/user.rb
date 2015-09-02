##
# User model
#
class User
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  include BCrypt

  field :name,          type: String
  field :email,         type: String
  field :password_hash, type: String
  field :verify,        type: Boolean, default: false
  field :token,         type: String,
                        default: -> { Digest::SHA1.hexdigest Time.now.to_s }

  index({ email: 1 }, unique: true, name: 'email_index')

  validates_presence_of :token, :email
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, on: :create
            }

  has_many :tasks

  ##
  # Create new user
  #
  def self.signup(user = {})
    user = User.new(
      name: user[:name] || nil,
      email: user[:email],
      password: user[:password]
    )

    user.save ? user : false
  end

  ##
  # Signin
  def self.signin(obj = {})
    user = User.where(email: obj[:email]).first
    user.password == obj[:password] ? user : false
  end

  ##
  # Validate token
  def self.validate_token(token)
    user = User.where(token: token).first
    user ? user : false
  end

  ##
  # Return o generate new password
  def password
    @password ||= Password.new(password_hash)
  end

  ##
  # Assign password
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

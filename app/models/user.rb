class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'facebook@login'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :identities, dependent: :destroy
  has_many :journeys
  has_many :comments

  has_many :comments_as_sender, foreign_key: "sender_id", class_name: "Comment"   # Requests that you make to different people

  has_many :comments_as_receiver, foreign_key: "receiver_id", class_name: "Comment"

  
  def self.find_for_oauth(auth, signed_in_resource=nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    user = create_user(auth, identity) if user.nil?
    user
  end

  private
  def self.create_user(auth, identity=nil)
    # Get the existing user by email if the provider gives us a verified email.
    # If no verified email was provided we assign a temporary email and ask the
    # user to verify it on the next step via UsersController.finish_signup
    email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
    email = auth.info.email if email_is_verified

    # Select a user if they have already registered
    user = User.find_by_email(email) if email
    # Create the user if it's a new registration
    if user.nil?
      user = User.new(
        # name: auth.extra.raw_info.name,
        image: auth.info.image || "",
        email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
        password: Devise.friendly_token[0,20]
      )
      # If you use confirmable module 
      # user.skip_confirmation!
      user.save!
    end

    # Save the user to the identity
    identity.user = user
    identity.save
    
    user
  end

end

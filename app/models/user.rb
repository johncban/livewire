class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :appointments, through: :locations, :dependent => :destroy
  has_many :comments, through: :posts
  has_many :appointments, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow', :dependent => :destroy
  has_many :followees, through: :followed_users, :dependent => :destroy
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow', :dependent => :destroy
  has_many :followers, through: :following_users, :dependent => :destroy

  has_friendship

  def friends?
    friends
  end

  def friend_requests?
    requested_friends.any?
  end

  def requested_friends?
    pending_friends.any?
  end

  def invite_friend(user)
    friend_request(user)
  end

  def not_friends
    potential = []
    User.all.each do |user|
      if friends_with?(user) != true && self != user && friends.include?(user) != true && pending_friends.include?(user) != true && requested_friends.include?(user) != true
        potential << user
      end
    end
    potential
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end

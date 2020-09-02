class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, through: :locations
  has_many :comments, through: :posts
  has_many :appointments
  has_many :posts

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_friendship

  def friends?
    self.friends
  end

  def friend_requests?
      self.requested_friends.any?
  end

  def requested_friends?
      self.pending_friends.any?
  end

  def invite_friend(user)
      self.friend_request(user)
  end

  def not_friends
      potential = []
      User.all.each do |user|
          if(self.friends_with?(user) != true && self != user && self.friends.include?(user) != true && self.pending_friends.include?(user) != true && self.requested_friends.include?(user) != true)
              potential << user
          end
      end
      potential
  end
end

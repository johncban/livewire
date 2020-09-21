class Post < ApplicationRecord
  validates_presence_of :post_content
  validates_presence_of :user


  acts_as_commentable

  belongs_to :user
  delegate :name, to: :user

  has_many :users, through: :comments

  auto_html_for :post_content do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: false)
    link target: '_blank', rel: 'nofollow'
    #simple_format
  end

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def self.by_date
    order(:created_at)
  end

  def self.by_specific_user user
    Post.select { |p| p.user_id == user.id }
  end

  def self.by_portfolio portfolio
    Post.select { |p| p.portfolio_id == portfolio.id }
  end

  def self.by_appointment _appointment
    Post.select { |p| p.appointment_id == trip.id }
  end
end

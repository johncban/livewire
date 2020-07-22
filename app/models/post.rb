class Post < ApplicationRecord
    belongs_to :user, polymorphic: true
    belongs_to :appointment, optional: true, polymorphic: true
    belongs_to :portfolio, optional: true, polymorphic: true

    acts_as_commontable

    def self.by_date
        order(:created_at)
    end

    def self.by_specific_user user
        Post.select{
            |p| p.user_id == user.id
        }
    end

    def self.by_portfolio portfolio
        Post.select{
            |p| p.portfolio_id == portfolio.id
        }
    end

    def self.by_appointment appointment
        Post.select {
            |p| p.appointment_id == appointment.id
        }
    end
end

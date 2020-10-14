# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# States
State.destroy_all
states = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY]

states.each do |state|
  State.create(statename: state)
end

User.destroy_all
User.create!([
               { name: 'John Doe', email: 'jd@jd.com', password: 'jd123456', password_confirmation: 'jd123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
               { name: 'John Annon', email: 'ja@ja.com', password: 'ja123456', password_confirmation: 'ja123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
               { name: 'John Q', email: 'jq@jq.com', password: 'jq123456', password_confirmation: 'jq123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
               { name: 'John Oh', email: 'jo@jo.com', password: 'jo123456', password_confirmation: 'jo123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
               { name: 'John No', email: 'jn@jn.com', password: 'jn123456', password_confirmation: 'jn123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil }
             ])

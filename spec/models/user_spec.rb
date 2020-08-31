require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  # Source: https://stackoverflow.com/questions/31499006/rails-testing-user-model-with-rspec-and-devise
  it 'is database authenticable' do
    user = User.create(
      name: 'John Test',
      email: 'test@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

=begin
  describe 'associations' do
    it { should have_many(:posts).through(:appointment) }
  end
=end

end






require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it { should validate_presence_of(:appt_name) }
    it { should validate_presence_of(:appt_description) }
    it { should validate_presence_of(:appt_date) }
    it { should validate_presence_of(:appt_address) }
    it { should validate_presence_of(:appt_city) }
    it { should validate_presence_of(:appt_state) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    # it { should have_many(:posts) }
  end
end

require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'User' do
    subject { User.create!(name: 'Tom', email: 'tom@gmail.com', password: 'password') }

    it { is_expected.to have_attributes(name: 'Tom') }

    it 'should validate user on create' do
      expect(subject).to be_valid
    end

    it 'show the user/s email' do
      expect(subject).to have_attributes(email: 'tom@gmail.com')
    end
  end
end
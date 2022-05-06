require 'rails_helper'

RSpec.describe User, tyoe: :model do
  subject { User.new(name: 'Vinny', email: 'Vinny@mail.com', password: 'password') }

  before { subject.save }

  it 'should validate user before creating' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
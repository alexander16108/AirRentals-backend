require 'rails_helper'

RSpec.describe Plane, type: :model do
  subject do
    Plane.create(name: 'twin-turbine', capacity: '2', range: '1,000 miles', url: 'https://www.jetblue.com/',
                 speed: '1,500 mph', city: 'New York', images: 'https://cutt.ly/sGGPomv', price: '1500')
  end

  before { subject.save }

  it 'should validate plane' do
    expect(subject).to be_valid
  end

  it 'should not be a valid  plane' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should display plane image' do
    expect(subject.images).to eq('https://cutt.ly/sGGPomv')
  end

  it 'should display apartment capacity' do
    expect(subject.capacity).to eq(2)
  end
end

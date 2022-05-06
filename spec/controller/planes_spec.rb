require 'rails_helper'
RSpec.describe User, type: :feature do
  describe 'Plane' do
    date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month
    
    # rubocop:disable Layout/LineLength
    subject do
      Plane.create(name: "Private jet", capacity: "2", range: "1,000 miles", url: "https://www.jetblue.com/", speed: "1,500 mph", city: "New York", images: "https://cutt.ly/BGGAzoH", price: "4325")
    end

    # rubocop:enable Layout/LineLength
    it { is_expected.to have_attributes(name: 'Private jet') }

    it 'should validate plane on create' do
      expect(subject).to be_valid
    end

    it 'should not be a valid plane' do
      subject.name = nil
      subject.images = nil
      expect(subject).to_not be_valid
    end

    it 'shows the plane\'s image' do
      expect(subject).to have_attributes(url: "https://www.jetblue.com/")
    end
  end
end
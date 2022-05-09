require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Validaiton for Reservations' do
    subject do
      user = User.create(email: 'tom@gmail.com',
                         password: 'password', name: 'Tom')
      plane = Plane.create(name: 'twin-turbine', capacity: '2', range: '1,000 miles', url: 'https://www.jetblue.com/',
                           speed: '1,500 mph', city: 'New York', images: 'https://cutt.ly/sGGPomv', price: '1500')

      Reservation.create(date_of_reservation: DateTime.now + 1.month, end_of_reservation: (DateTime.now + (1 +
       4).month), cancelled: false,
                         user_id: user.id, plane_id: plane.id)
    end

    it 'Should be valide before save' do
      expect(subject).to be_valid
    end

    it 'Should fail' do
      subject.end_of_reservation = DateTime.now
      expect(subject).to_not be_valid
    end

    it 'Should have not be less than date_of_reservation' do
      subject.end_of_reservation = DateTime.now + 1.month
      subject.date_of_reservation = nil
      expect(subject).to_not be_valid
    end
  end
end

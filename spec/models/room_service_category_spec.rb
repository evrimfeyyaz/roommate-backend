require 'rails_helper'
require 'timecop'

describe RoomServiceCategory do
  it_behaves_like 'a tenant model'

  it { should have_many(:room_service_items).through(:room_service_categories_items) }

  it { should validate_presence_of(:title) }

  describe '#available_from' do
    it 'returns the time in HH:MM format' do
      Timecop.freeze(Time.zone.parse('2000-01-01 4:00:00')) do
        subject.available_from = 1.hour.ago

        expect(subject.available_from).to be_a(String)
        expect(subject.available_from).to eq('03:00')
      end
    end
  end

  describe '#available_until' do
    it 'returns the time in HH:MM format' do
      Timecop.freeze(Time.zone.parse('2000-01-01 4:00:00')) do
        subject.available_until = 1.hour.ago

        expect(subject.available_until).to be_a(String)
        expect(subject.available_until).to eq('03:00')
      end
    end
  end

  describe '#available_at_the_moment?' do
    around(:each) do |example|
      # Trying a time zone apart from UTC to make sure it works properly anyways.
      Time.use_zone('Hawaii') do
        example.run
      end
    end

    context 'when #available_from and #available_until are both present' do
      context 'and the current time is within available hours' do
        it 'returns true' do
          # Check out https://stackoverflow.com/questions/34978905/rails-activerecord-postgres-time-format
          # regarding why '2000-01-01' is used as the date.
          subject.available_from  = 1.hour.ago
          subject.available_until = 1.hour.from_now

          expect(subject.available_at_the_moment?).to be true
        end
      end

      context 'and the current time is outside available hours' do
        it 'returns false' do
          subject.available_from  = 1.hour.from_now
          subject.available_until = 2.hours.from_now

          expect(subject.available_at_the_moment?).to be false
        end
      end
    end

    context 'when #avaiable_from and #available_to are both blank' do
      it 'returns true' do
        subject.available_from  = nil
        subject.available_until = nil

        expect(subject.available_at_the_moment?).to be true
      end
    end

    context 'when #available_from is blank but #available_until is present' do
      around(:each) do |example|
        Timecop.freeze(Time.zone.parse('2000-01-01 18:00:00')) do
          example.run
        end
      end

      before(:each) do
        subject.available_from = nil
      end

      it 'returns true when the current time is before #available_until' do
        subject.available_until = '19:00'

        expect(subject.available_at_the_moment?).to be true
      end

      it 'returns false when the current time is after #available_until' do
        subject.available_until = '17:00'

        expect(subject.available_at_the_moment?).to be false
      end
    end

    context 'when #available_from is present but #available_until is blank' do
      around(:each) do |example|
        Timecop.freeze(Time.zone.parse('2000-01-01 18:00:00')) do
          example.run
        end
      end

      before(:each) do
        subject.available_until = nil
      end

      it 'returns true when the current time is after #available_from' do
        subject.available_from = '17:00'

        expect(subject.available_at_the_moment?).to be true
      end

      it 'returns false when the current time is before #available_from' do
        subject.available_from = '19:00'

        expect(subject.available_at_the_moment?).to be false
      end
    end

    context 'when #available_from is before midnight and #available_until is after midnight' do
      context 'and the current time is between available hours' do
        it 'returns true' do
          subject.available_from  = Time.zone.parse('2000-01-01 21:00:00')
          subject.available_until = Time.zone.parse('2000-01-01 03:00:00')

          Timecop.freeze(Time.zone.parse('2000-01-01 22:00:00')) do
            expect(subject.available_at_the_moment?).to be true
          end
        end
      end

      context 'and given time is outside those times' do
        it 'returns false' do
          subject.available_from  = Time.zone.parse('2000-01-01 21:00:00')
          subject.available_until = Time.zone.parse('2000-01-01 03:00:00')

          Timecop.freeze(Time.zone.parse('2000-01-01 4:00:00')) do
            expect(subject.available_at_the_moment?).to be false
          end
        end
      end
    end
  end
end
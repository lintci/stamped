require 'spec_helper'

describe Stamped do
  it 'has a version number' do
    expect(Stamped::VERSION).not_to be nil
  end
end

describe Time do
  let(:time){Time.parse('2015-03-25 00:33:07 UTC')}
  let(:timestamp){'2015-03-25T00:33:07Z'}

  describe '#stamp' do
    it 'generates the expected stamp' do
      expect(time.stamp).to eq(timestamp)
    end
  end

  describe '.stamp' do
    context 'when given a time' do
      it 'generates the expected stamp' do
        expect(Time.stamp(time)).to eq(timestamp)
      end
    end

    context 'when not given a time' do
      it 'generates the expected stamp for now' do
        Timecop.freeze(time) do
          expect(Time.stamp).to eq(timestamp)
        end
      end
    end
  end

  describe '.from_stamp' do
    it 'returns the expected time' do
      expect(Time.from_stamp(timestamp)).to eq(time)
    end
  end

  describe '.stamp_time' do
    it 'returns a UTC time' do
      expect(Time.stamp_time).to be_utc
    end

    it 'returns no fractions of a second' do
      expect(Time.stamp_time.to_r.denominator).to eq(1)
    end

    it 'returns the expected time' do
      Timecop.freeze(time) do
        expect(Time.stamp_time).to eq(time)
      end
    end
  end
end

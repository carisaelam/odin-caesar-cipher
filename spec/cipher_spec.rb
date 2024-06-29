require_relative '../cipher'

RSpec.describe CaesarCipher do
  describe '#ord_array' do
    it 'turns each character into an ordinal number' do
      expect(subject.ord_array('abc')).to eql([97, 98, 99])
    end

    it 'downcases letters before converting to ordinal' do
      expect(subject.ord_array('ABC')).to eql([97, 98, 99])
    end

    it 'works for a single character string' do
      expect(subject.ord_array('a')).to eql([97])
    end
  end

  describe '#adjusted_ord_array' do
    it 'shifts each char ord number by shift factor' do
      expect(subject.adjusted_ord_array([97, 98, 99], 1)).to eql([98, 99, 100])
    end

    it 'works for a single character array' do
      expect(subject.adjusted_ord_array([97], 1)).to eql([98])
    end

    it 'only shifts characters a-z' do
      expect(subject.adjusted_ord_array([96, 123], 1)).to eql([96, 123])
    end

    it 'loops to a after z' do
      expect(subject.adjusted_ord_array([122], 1)).to eql([97])
    end
  end

  describe '#cipher' do
    it 'returns a shifted string' do
      expect(subject.cipher('I will shift 4 characters', 4)).to eql('m ampp wlmjx 4 glevegxivw')
    end
  end
end

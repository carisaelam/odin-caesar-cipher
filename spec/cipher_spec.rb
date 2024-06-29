require_relative '../cipher'

RSpec.describe '#cipher' do
  it 'exists' do
    expect(cipher('I will shift 4 characters', 4)).to eql('m ampp wlmjx 4 glevegxivw')
  end
end

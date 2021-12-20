RSpec.describe 'calculate_fuel' do
  subject(:calculate) { calculate_fuel(input) }

  context 'when case 1' do
    let(:input) { [16] }

    it 'returns 0' do
      expect(calculate).to eq(0)
    end
  end

  context 'when case 2' do
    let(:input) { [16, 1] }

    it 'returns 120' do
      expect(calculate).to eq(120)
    end
  end

  context 'when case3' do
    let(:input) { [16, 1, 2] }

    it 'returns 80' do
      expect(calculate).to eq(80) # alignment on 2
    end
  end

  context 'when case 4' do
    let(:input) { [15, 32, 5, 8, 108] }

    it 'returns 3753' do
      expect(calculate).to eq(3753)
    end
  end

  context 'when case 5' do
    let(:input) { [15, 32, 5, 8, 108, 13] }

    it 'returns 3935' do
      expect(calculate).to eq(3935)
    end
  end

  context 'when case 6' do
    let(:input_str) { '16,1,2,0,4,2,7,1,2,14' }
    let(:input) { input_str.strip.split(',').map(&:to_i) }

    it 'returns 168' do
      expect(calculate).to eq(168)
    end
  end

  context 'when case final' do
    let(:input_str) { File.read('./spec/fixtures/final_case.txt') }
    let(:input) { input_str.strip.split(',').map(&:to_i) }

    it 'returns 37' do
      expect(calculate).to eq(93_397_632)
    end
  end
end

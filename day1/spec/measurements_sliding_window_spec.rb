# frozen_string_literal: true

RSpec.shared_examples 'counts number of measurement with sliding window increases correctly' do |expected_count|
  it 'counts number of measurement with sliding window increases correctly' do
    expect(number_of_measurement_with_sliding_window_increases(lines_with_integers)).to eq(expected_count)
  end
end

RSpec.describe 'number_of_measurement_with_sliding_window_increases' do
  let(:read_lines) do
    File.readlines("./spec/fixtures/#{file}")
  end

  let(:lines_with_integers) do
    read_lines.map(&:to_i)
  end

  context 'when case1' do
    let(:file) { 'case1.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 1728
  end

  context 'when case2' do
    let(:file) { 'case2.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 0
  end

  context 'when case3' do
    let(:file) { 'case3.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 0
  end

  context 'when case4' do
    let(:file) { 'case4.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 5
  end

  context 'when case5' do
    let(:file) { 'case5.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 1
  end

  context 'when case6' do
    let(:file) { 'case6.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 1
  end

  context 'when case7' do
    let(:file) { 'case7.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 1
  end

  context 'when case8' do
    let(:file) { 'case8.txt' }

    it_behaves_like 'counts number of measurement with sliding window increases correctly', 2
  end
end

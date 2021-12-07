# frozen_string_literal: true

RSpec.shared_examples 'counts number of measurement increases correctly' do |expected_count|
  it 'counts number of measurement increases correctly' do
    expect(number_of_measurement_increases(lines_with_integers)).to eq(expected_count)
  end
end

RSpec.describe 'number_of_measurement_increases' do
  let(:read_lines) do
    File.readlines("./spec/fixtures/#{file}")
  end

  let(:lines_with_integers) do
    read_lines.map(&:to_i)
  end

  context 'when case1' do
    let(:file) { 'case1.txt' }

    it_behaves_like 'counts number of measurement increases correctly', 1688
  end

  context 'when case2' do
    let(:file) { 'case2.txt' }

    it_behaves_like 'counts number of measurement increases correctly', 0
  end

  context 'when case3' do
    let(:file) { 'case3.txt' }

    it_behaves_like 'counts number of measurement increases correctly', 1
  end

  context 'when case4' do
    let(:file) { 'case4.txt' }

    it_behaves_like 'counts number of measurement increases correctly', 7
  end
end

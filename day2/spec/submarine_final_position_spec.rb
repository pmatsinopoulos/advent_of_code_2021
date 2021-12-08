# frozen_string_literal: true

RSpec.shared_examples 'calculating correct position' do |expected_position|
  it 'returns the correct position' do
    expect(submarine_position).to eq(expected_position)
  end
end

RSpec.describe 'submarine_final_position' do
  let(:submarine_position) do
    submarine_final_position(movements)
  end

  let(:movements) do
    file_path = "spec/fixtures/#{file}"

    File.readlines(file_path).map do |movement|
      direction, length = movement.split(/\s+/)
      { direction: direction, length: length.to_i }
    end
  end

  context 'when case1.txt' do
    let(:file) { 'case1.txt' }

    it_behaves_like 'calculating correct position', 0
  end

  context 'when case2.txt' do
    let(:file) { 'case2.txt' }

    it_behaves_like 'calculating correct position', 0
  end

  context 'when case3.txt' do
    let(:file) { 'case3.txt' }

    it_behaves_like 'calculating correct position', 0
  end

  context 'when case4.txt' do
    let(:file) { 'case4.txt' }

    it_behaves_like 'calculating correct position', 900
  end

  context 'when final_case.txt' do
    let(:file) { 'final_case.txt' }

    it_behaves_like 'calculating correct position', 1408487760
  end
end

# frozen_string_literal: true

RSpec.shared_examples 'calculating the correct life support rating to be' do |expected_life_support_rating|
  it 'calculates the correct life support rating' do
    expect(life_support).to eq(expected_life_support_rating)
  end
end

RSpec.describe 'life_support_rating' do
  let(:life_support) { life_support_rating(metrics) }

  let(:metrics) do
    file_path = "spec/fixtures/#{file}"

    File.readlines(file_path).map(&:strip)
  end

  context 'when case1' do
    let(:file) { 'case1.txt' }

    it_behaves_like 'calculating the correct life support rating to be', 69
  end

  context 'when case2' do
    let(:file) { 'case2.txt' }

    it_behaves_like 'calculating the correct life support rating to be', 192_441
  end

  context 'when case3' do
    let(:file) { 'case3.txt' }

    it_behaves_like 'calculating the correct life support rating to be', 230
  end

  context 'when final_case' do
    let(:file) { 'final_case.txt' }

    it_behaves_like 'calculating the correct life support rating to be', 3_969_126
  end
end

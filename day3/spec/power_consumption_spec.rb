# frozen_string_literal: true

RSpec.shared_examples 'calculating the correct power consumption to be' do |expected_power_consumption|
  it 'calculates the correct power consumption' do
    expect(power).to eq(expected_power_consumption)
  end
end

RSpec.describe 'power_consumption' do
  let(:power) { power_consumption(metrics) }

  let(:metrics) do
    file_path = "spec/fixtures/#{file}"

    File.readlines(file_path)
  end

  context 'when case1' do
    let(:file) { 'case1.txt' }

    it_behaves_like 'calculating the correct power consumption to be', 277_794
  end

  context 'when case2' do
    let(:file) { 'case2.txt' }

    it_behaves_like 'calculating the correct power consumption to be', 277_794
  end

  context 'when case3' do
    let(:file) { 'case3.txt' }

    it_behaves_like 'calculating the correct power consumption to be', 198
  end

  context 'when final_case' do
    let(:file) { 'final_case.txt' }

    it_behaves_like 'calculating the correct power consumption to be', 738_234
  end
end

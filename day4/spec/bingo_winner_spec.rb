# frozen_string_literal: true

RSpec.shared_examples 'calculating the bingo winner final score being' do |expected_score|
  it 'calculates the score of the bingo winner' do
    expect(bingo).to eq(expected_score)
  end
end

RSpec.describe 'bingo_winner_final_score' do
  let(:file) do
    "./spec/fixtures/#{filename}"
  end

  let(:bingo) do
    bingo_winner_final_score(file_contents: File.read(file))
  end

  context 'when case1' do
    let(:filename) { 'case1.txt' }

    it_behaves_like 'calculating the bingo winner final score being', 4512
  end
end

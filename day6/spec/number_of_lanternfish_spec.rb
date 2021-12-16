RSpec.describe 'number_of_lanternfish' do
  let(:number) { number_of_lanternfish(case1, number_of_days) }

  context 'given the case1' do
    let(:case1) do
      '3,4,3,1,2'
    end

    [
      { 1 => 5 },
      { 2 => 6 },
      { 3 => 7 },
      { 4 => 9 },
      { 5 => 10 },
      { 6 => 10 },
      { 7 => 10 },
      { 8 => 10 },
      { 9 => 11 },
      { 10 => 12 },
      { 11 => 15 },
      { 12 => 17 },
      { 13 => 19 },
      { 14 => 20 },
      { 15 => 20 },
      { 16 => 21 },
      { 17 => 22 },
      { 18 => 26 },
      { 80 => 5934 }
    ].each do |input_and_output|
      context "then after #{input_and_output.keys.first} days" do
        let(:number_of_days) { input_and_output.keys.first }

        it "the number of lanternfish will be #{input_and_output.values.first}" do
          result = number
          expect(result).to eq(input_and_output.values.first)
          # expect(result).to eq([3, 4, 3, 1, 2])
        end
      end
    end
  end

  context 'given the case2' do
    let(:case1) do
      '3,3,5,1,1,3,4,2,3,4,3,1,1,3,3,1,5,4,4,1,4,1,1,1,3,3,2,3,3,4,2,5,1,4,1,2,2,4,2,5,1,2,2,1,1,1,1,4,5,4,3,1,4,4,4,5,1,1,4,3,4,2,1,1,1,1,5,2,1,4,2,4,2,5,5,5,3,3,5,4,5,1,1,5,5,5,2,1,3,1,1,2,2,2,2,1,1,2,1,5,1,2,1,2,5,5,2,1,1,4,2,1,4,2,1,1,1,4,2,5,1,5,1,1,3,1,4,3,1,3,2,1,3,1,4,1,2,1,5,1,2,1,4,4,1,3,1,1,1,1,1,5,2,1,5,5,5,3,3,1,2,4,3,2,2,2,2,2,4,3,4,4,4,1,2,2,3,1,1,4,1,1,1,2,1,4,2,1,2,1,1,2,1,5,1,1,3,1,4,3,2,1,1,1,5,4,1,2,5,2,2,1,1,1,1,2,3,3,2,5,1,2,1,2,3,4,3,2,1,1,2,4,3,3,1,1,2,5,1,3,3,4,2,3,1,2,1,4,3,2,2,1,1,2,1,4,2,4,1,4,1,4,4,1,4,4,5,4,1,1,1,3,1,1,1,4,3,5,1,1,1,3,4,1,1,4,3,1,4,1,1,5,1,2,2,5,5,2,1,5'
    end

    [
      { 80 => 362_740 }
    ].each do |input_and_output|
      context "then after #{input_and_output.keys.first} days" do
        let(:number_of_days) { input_and_output.keys.first }

        it "the number of lanternfish will be #{input_and_output.values.first}" do
          result = number
          expect(result).to eq(input_and_output.values.first)
          # expect(result).to eq([3, 4, 3, 1, 2])
        end
      end
    end
  end
end

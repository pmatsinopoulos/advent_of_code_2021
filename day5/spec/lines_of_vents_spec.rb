# frozen_string_literal: true

RSpec.describe LinesOfVents do
  let(:spec_str) { File.read("./spec/fixtures/#{file}") }

  context 'when case1.txt' do
    let(:file) { 'case1.txt' }

    it 'creates a lines of vents from a string containing the line segment specs' do
      lines_of_vents = LinesOfVents.new(spec_str: spec_str)

      expect(lines_of_vents.x_max).to eq(9)
      expect(lines_of_vents.y_max).to eq(9)
      
      expect(lines_of_vents.number_of_points_with_lines_overlap).to eq(5)
    end
  end

  context 'when case2.txt' do
    let(:file) { 'case2.txt' }

    it 'creates a lines of vents from a string containing the line segment specs' do
      lines_of_vents = LinesOfVents.new(spec_str: spec_str)

      expect(lines_of_vents.x_max).to eq(9)
      expect(lines_of_vents.y_max).to eq(9)

      expect(lines_of_vents.number_of_points_with_lines_overlap).to eq(5)
    end
  end

  context 'when final_case.txt' do
    let(:file) { 'final_case.txt' }

    it 'creates a lines of vents from a string containing the line segment specs' do
      lines_of_vents = LinesOfVents.new(spec_str: spec_str)

      expect(lines_of_vents.number_of_points_with_lines_overlap).to eq(5306)
    end
  end
end

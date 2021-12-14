# frozen_string_literal: true

RSpec.describe LinesOfVents do
  let(:spec_str) { File.read("./spec/fixtures/#{file}") }

  context 'when case1.txt' do
    let(:file) { 'case1.txt' }

    it 'creates a lines of vents from a string containing the line segment specs' do
      lines_of_vents = LinesOfVents.new(spec_str: spec_str)

      line_segments = lines_of_vents.line_segments
      expect(line_segments.count).to eq(10)

      expect(line_segments[ 0]).to eq(LineSegment.new(line_segment_spec_str: '0,9 -> 5,9'))
      expect(line_segments[ 1]).to eq(LineSegment.new(line_segment_spec_str: '8,0 -> 0,8'))
      expect(line_segments[ 2]).to eq(LineSegment.new(line_segment_spec_str: '9,4 -> 3,4'))
      expect(line_segments[ 3]).to eq(LineSegment.new(line_segment_spec_str: '2,2 -> 2,1'))
      expect(line_segments[ 4]).to eq(LineSegment.new(line_segment_spec_str: '7,0 -> 7,4'))
      expect(line_segments[ 5]).to eq(LineSegment.new(line_segment_spec_str: '6,4 -> 2,0'))
      expect(line_segments[ 6]).to eq(LineSegment.new(line_segment_spec_str: '0,9 -> 2,9'))
      expect(line_segments[ 7]).to eq(LineSegment.new(line_segment_spec_str: '3,4 -> 1,4'))
      expect(line_segments[ 8]).to eq(LineSegment.new(line_segment_spec_str: '5,5 -> 8,2'))
      expect(line_segments[ 9]).to eq(LineSegment.new(line_segment_spec_str: '0,0 -> 8,8'))

      expect(lines_of_vents.x_max).to eq(9)
      expect(lines_of_vents.y_max).to eq(9)
    end
  end
end

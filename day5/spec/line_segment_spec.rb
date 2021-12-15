RSpec.describe LineSegment do
  it 'can be instantiated properly - case 1' do
    line_segment_spec_str = '0,9 -> 5,9'
    line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

    expect(line_segment.start_point.x).to eq(0)
    expect(line_segment.start_point.y).to eq(9)

    expect(line_segment.end_point.x).to eq(5)
    expect(line_segment.end_point.y).to eq(9)

    expect(line_segment.x_max).to eq(5)
    expect(line_segment.y_max).to eq(9)
  end

  it 'can be instantiated properly - case 1' do
    line_segment_spec_str = '5,9 -> 3,2'
    line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

    expect(line_segment.start_point.x).to eq(3)
    expect(line_segment.start_point.y).to eq(2)

    expect(line_segment.end_point.x).to eq(5)
    expect(line_segment.end_point.y).to eq(9)

    expect(line_segment.x_max).to eq(5)
    expect(line_segment.y_max).to eq(9)
  end

  describe '#vertical?' do
    context 'when x on both points is equal' do
      it 'returns true' do
        line_segment_spec_str = '0,9 -> 0,10'
        line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

        expect(line_segment.vertical?).to eq(true)
      end
    end

    context 'when x of points differ' do
      it 'returns false' do
        line_segment_spec_str = '8,9 -> 0,10'
        line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

        expect(line_segment.vertical?).to eq(false)
      end
    end
  end

  describe '#horizontal?' do
    context 'when y on both points is equal' do
      it 'returns true' do
        line_segment_spec_str = '1,9 -> 0,9'
        line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

        expect(line_segment.horizontal?).to eq(true)
      end
    end

    context 'when y of points differ' do
      it 'returns false' do
        line_segment_spec_str = '8,9 -> 0,10'
        line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

        expect(line_segment.horizontal?).to eq(false)
      end
    end
  end

  describe '#diagonal?' do
    it 'returns true for case 1' do
      line_segment_spec_str = '8,8 -> 10,10'
      line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

      expect(line_segment.diagonal?).to eq(true)
    end

    it 'returns true for case 2' do
      line_segment_spec_str = '8,0 -> 0,8'
      line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

      expect(line_segment.diagonal?).to eq(true)
    end

    it 'returns false for case 3' do
      line_segment_spec_str = '8,8 -> 9,10'
      line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

      expect(line_segment.diagonal?).to eq(false)
    end

    it 'returns true for case 4' do
      line_segment_spec_str = '6,4 -> 2,0'
      line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

      expect(line_segment.diagonal?).to eq(true)
    end

    it 'returns true for case 5' do
      line_segment_spec_str = '0,9 -> 5,9'
      line_segment = LineSegment.new(line_segment_spec_str: line_segment_spec_str)

      expect(line_segment.diagonal?).to eq(false)
    end
  end
end

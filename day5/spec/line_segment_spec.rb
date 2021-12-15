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
end

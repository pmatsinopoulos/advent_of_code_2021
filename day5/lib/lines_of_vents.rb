class LinesOfVents
  def initialize(spec_str:)
    self.spec_str = spec_str
    self.line_segments = build_line_segments
    self.x_max = calculate_maximum_x
    self.y_max = calculate_maximum_y
  end

  attr_reader :line_segments, :x_max, :y_max

  private

  def build_line_segments
    spec_str.lines.map do |line|
      LineSegment.new(line_segment_spec_str: line.strip)
    end
  end

  def calculate_maximum_x
    line_segments.map(&:x_max).max
  end

  def calculate_maximum_y
    line_segments.map(&:y_max).max
  end

  attr_writer :line_segments, :x_max, :y_max
  attr_accessor :spec_str
end

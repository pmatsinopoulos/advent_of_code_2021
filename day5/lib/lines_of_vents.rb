class LinesOfVents
  def initialize(spec_str:)
    self.spec_str = spec_str
    self.line_segments = build_line_segments
    self.x_max = calculate_maximum_x
    self.y_max = calculate_maximum_y
  end

  def number_of_points_with_lines_overlap
    initial_area = Array.new(x_max + 1) { Array.new(y_max + 1) { 0 } }
    result = {}
    line_segments.select { |ls| ls.start_point.x == ls.end_point.x || ls.start_point.y == ls.end_point.y }.each do |line_segment|
      i = line_segment.start_point.x
      while i <= line_segment.end_point.x
        j = line_segment.start_point.y
        while j <= line_segment.end_point.y
          initial_area[j][i] += 1
          result[{ j: j, i: i }] = true if initial_area[j][i] >= 2
          j += 1
        end
        i += 1
      end
    end
    result.keys.count
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

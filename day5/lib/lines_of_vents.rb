class LinesOfVents
  def initialize(spec_str:)
    self.spec_str = spec_str
    self.line_segments = build_line_segments
  end

  attr_reader :line_segments

  private

  def build_line_segments
    spec_str.lines.map do |line|
      LineSegment.new(line_segment_spec_str: line.strip)
    end
  end

  attr_writer :line_segments
  attr_accessor :spec_str
end

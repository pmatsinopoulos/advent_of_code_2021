# frozen_string_literal: true

require 'point'

class LineSegment
  def initialize(line_segment_spec_str:)
    self.line_segment_spec_str = line_segment_spec_str
    parsed_line = parse_line_segment_spec_str
    self.start_point = Point.new(**parsed_line[:start_point])
    self.end_point = Point.new(**parsed_line[:end_point])
    if self.end_point < self.start_point
      temp_point = self.start_point
      self.start_point = self.end_point
      self.end_point = temp_point
    end
  end

  def ==(value)
    self.start_point == value.start_point && self.end_point == value.end_point
  end

  def x_max
    [start_point.x, end_point.x].max
  end

  def y_max
    [start_point.y, end_point.y].max
  end

  def vertical?
    start_point.x == end_point.x
  end

  def horizontal?
    start_point.y == end_point.y
  end

  def diagonal?
    return false if start_point.y == end_point.y

    (start_point.x - end_point.x).abs / (start_point.y - end_point.y).abs == 1
  end

  attr_reader :end_point, :start_point

  private

  attr_accessor :line_segment_spec_str
  attr_writer :end_point, :start_point

  def parse_line_segment_spec_str
    start_point, end_point = line_segment_spec_str.split('->').map(&:strip)
    x, y = start_point.split(',').map(&:to_i)
    start_point = { x: x, y: y }
    x, y = end_point.split(',').map(&:to_i)
    end_point = { x: x, y: y }

    { start_point: start_point, end_point: end_point }
  end
end

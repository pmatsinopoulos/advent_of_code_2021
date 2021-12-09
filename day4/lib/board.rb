# frozen_string_literal: true

class Board
  def initialize(lines:)
    build_from_lines(lines)
  end

  attr_reader :matrix

  private

  def build_from_lines(lines)
    @matrix = []
    lines.lines.each do |line|
      line.strip!
      unless line.empty?
        @matrix.push(line.split(' ').map(&:to_i))
      end
    end
  end
end

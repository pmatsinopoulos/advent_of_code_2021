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

def build_boards(array_of_lines)
  boards = []
  left = 0
  while left < array_of_lines.size - 1
    right = left + 1

    while !array_of_lines[right].strip.empty?
      right += 1
    end
    # right points to an empty line
    lines_to_build_board = array_of_lines[left..right].join.strip
    boards.push(Board.new(lines: lines_to_build_board)) unless lines_to_build_board.empty?
    left = right
  end
  boards
end

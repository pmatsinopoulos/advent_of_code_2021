# frozen_string_literal: true

class Board
  def initialize(lines:)
    build_from_lines(lines)
    @marked_numbers = []
  end

  def mark_number(number)
    matrix.each_with_index do |matrix_line, i|
      matrix_line.each_with_index do |current_number, j|
        @marked_numbers.push([i, j]) if current_number == number && @marked_numbers.index([i, j]).nil?
      end
    end
  end

  def sum_of_unmarked
    sum = 0
    matrix.each_with_index do |matrix_line, i|
      matrix_line.each_with_index do |current_number, j|
        sum += current_number unless marked_numbers.index([i, j])
      end
    end
    sum
  end

  def wins?
    matrix.length.times do |i|
      return true if (0...matrix.length).to_a.all? { |j| marked_numbers.index([i, j]) }
      return true if (0...matrix.length).to_a.all? { |j| marked_numbers.index([j, i]) }
    end

    false
  end

  attr_reader :marked_numbers, :matrix

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

    while right < array_of_lines.length && !array_of_lines[right].strip.empty?
      right += 1
    end
    # right points to an empty line
    lines_to_build_board = array_of_lines[left..right].join.strip
    boards.push(Board.new(lines: lines_to_build_board)) unless lines_to_build_board.empty?
    left = right
  end
  boards
end

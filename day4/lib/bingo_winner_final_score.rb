# frozen_string_literal: true

require 'board'

def bingo_winner_final_score(file_contents:)
  numbers = file_contents.lines[0].map(&:to_i)
  boards = build_boards(file_contents.lines[1..])
  numbers.each do |number|
    boards.each do |board|
      board.mark_number(number)
    end
  end
end

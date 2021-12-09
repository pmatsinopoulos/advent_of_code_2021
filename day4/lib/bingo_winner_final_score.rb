# frozen_string_literal: true

require 'board'

def bingo_winner_final_score(file_contents:)
  numbers = file_contents.lines[0].strip.split(',').map(&:to_i)
  boards = build_boards(file_contents.lines[1..])
  wins_score = 0
  winning_boards = []
  numbers.each do |number|
    boards.each_with_index do |board, index|
      board.mark_number(number)

      if board.wins? && !winning_boards.index(index)
        wins_score = board.sum_of_unmarked * number
        winning_boards.push(index)
      end
    end
  end

  wins_score
end

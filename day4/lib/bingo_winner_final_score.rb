# frozen_string_literal: true

require 'board'

def bingo_winner_final_score(file_contents:)
  numbers = []
  boards =
  file_contents.lines.each_with_index do |line, index|
    numbers = line.strip.split(',').map(&:to_i) if index.zero?


  end
end

# frozen_string_literal: true

RSpec.describe Board do
  it 'can be built from a series of string lines' do
    input = <<~INPUT
          
      22 13 17 11  0
       8  2 23  4 24
      21  9 14 16  7
       6 10  3 18  5
       1 12 20 15 19

    INPUT

    board = Board.new(lines: input)

    expect(board.matrix).to eq(
      [
        [22, 13, 17, 11, 0],
        [8, 2, 23, 4, 24],
        [21, 9, 14, 16, 7],
        [6, 10, 3, 18, 5],
        [1, 12, 20, 15, 19]
      ],
    )
  end
end

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
        [22, 13, 17, 11,  0],
        [8,   2, 23,  4, 24],
        [21,  9, 14, 16,  7],
        [6,  10,  3, 18,  5],
        [1,  12, 20, 15, 19]
      ]
    )
  end

  describe '#mark_number' do
    context 'when a board is given' do
      let!(:board) do
        input = <<~INPUT
          
          22 13 17 11  0
           8  2 23  4 24
          21  9 14 16  7
           6 10  3 18  5
           1 12 20 15 19

        INPUT
        Board.new(lines: input)
      end

      context 'when number is 16' do
        it 'marks the 16 but not the others' do
          board.mark_number(16)

          expect(board.marked_numbers).to eq([[2, 3]]) # position of number 16
        end

        it 'marks the 16 only once even if called twice' do
          board.mark_number(16)
          board.mark_number(16)

          expect(board.marked_numbers).to eq([[2, 3]]) # position of number 16
        end
      end

      context 'when number is not in the matrix' do
        it 'does not mark any number' do
          board.mark_number(-1)

          expect(board.marked_numbers).to eq([]) # position of number 16
        end
      end
    end
  end

  describe '#sum_of_unmarked' do
    context 'when a board is given' do
      let!(:board) do
        input = <<~INPUT
          
          22 13 17 11  0
           8  2 23  4 24
          21  9 14 16  7
           6 10  3 18  5
           1 12 20 15 19

        INPUT
        Board.new(lines: input)
      end

      before do
        board.mark_number(13)
        board.mark_number(3)
      end

      it 'returns the sum of unmarked' do
        expect(board.sum_of_unmarked).to eq(board.matrix.flatten.sum - 13 - 3)
      end
    end
  end

  describe '#wins?' do
    context 'when a board is given' do
      let!(:board) do
        input = <<~INPUT
          
          22 13 17 11  0
           8  2 23  4 24
          21  9 14 16  7
           6 10  3 18  5
           1 12 20 15 19

        INPUT
        Board.new(lines: input)
      end

      context 'when some numbers are marked but not a complete row or column' do
        before do
          board.mark_number(13)
          board.mark_number(3)
        end

        it 'returns false' do
          expect(board.wins?).to eq(false)
        end
      end

      context 'when the numbers of a row are marked' do
        before do
          board.mark_number(21)
          board.mark_number(9)
          board.mark_number(14)
          board.mark_number(16)
          board.mark_number(7)
        end

        it 'returns true' do
          expect(board.wins?).to eq(true)
        end
      end

      context 'when the numbers of a column are marked' do
        before do
          board.mark_number(22)
          board.mark_number(8)
          board.mark_number(21)
          board.mark_number(6)
          board.mark_number(1)
        end

        it 'returns true' do
          expect(board.wins?).to eq(true)
        end
      end

    end
  end
end

RSpec.describe '#build_boards' do
  it 'converts an array of lines to boards' do
    input = <<~INPUT
      
      22 13 17 11  0
       8  2 23  4 24
      21  9 14 16  7
       6 10  3 18  5
       1 12 20 15 19
      
       3 15  0  2 22
       9 18 13 17  5
      19  8  7 25 23
      20 11 10 24  4
      14 21 16 12  6
      
      14 21 17 24  4
      10 16 15  9 19
      18  8 23 26 20
      22 11 13  6  5
       2  0 12  3  7

    INPUT

    boards = build_boards(input.lines)

    expect(boards).to be_a(Array)
    expect(boards.size).to eq(3)

    boards.each do |board|
      expect(board).to be_a(Board)
    end

    expect(boards[0].matrix).to eq(
      [
        [22, 13, 17, 11,  0],
        [8,   2, 23,  4, 24],
        [21,  9, 14, 16,  7],
        [6,  10,  3, 18,  5],
        [1,  12, 20, 15, 19]
      ]
    )

    expect(boards[1].matrix).to eq(
      [
        [ 3, 15,  0,  2, 22],
        [ 9, 18, 13, 17,  5],
        [19,  8,  7, 25, 23],
        [20, 11, 10, 24,  4],
        [14, 21, 16, 12,  6]
      ]
    )

    expect(boards[2].matrix).to eq(
      [
        [14, 21, 17, 24,  4],
        [10, 16, 15,  9, 19],
        [18,  8, 23, 26, 20],
        [22, 11, 13,  6,  5],
        [ 2,  0, 12,  3,  7]
      ]
    )
  end
end

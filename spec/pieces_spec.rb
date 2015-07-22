require_relative '../pieces.rb'
require 'spec_helper.rb'

describe Pawn do
  let(:white_pawn) {Pawn.new("white")}#{from_row: , from_col: , to_row: , to_col: }
  let(:black_pawn) {Pawn.new("black")}
  context 'when asked about the legality of a move' do
    describe '#move_legal?' do
      it 'returns false if passed an illegal move' do
        expect(white_pawn.move_legal?({from_row: 2, from_col: 3, to_row: 5, to_col: 3})).to be false#wrong row
        expect(white_pawn.move_legal?({from_row: 2, from_col: 3, to_row: 4, to_col: 4})).to be false#wrong col
        expect(white_pawn.move_legal?({from_row: 3, from_col: 3, to_row: 5, to_col: 3})).to be false#moved before and tried to move 2
        expect(black_pawn.move_legal?({from_row: 7, from_col: 3, to_row: 4, to_col: 3})).to be false#wrong row
        expect(black_pawn.move_legal?({from_row: 5, from_col: 3, to_row: 4, to_col: 6})).to be false#wrong col
        expect(black_pawn.move_legal?({from_row: 6, from_col: 3, to_row: 4, to_col: 3})).to be false#moved before and tried to move 2
      end
      it 'returns true if passed a legal move' do
        expect(white_pawn.move_legal?({from_row: 2, from_col: 3, to_row: 3, to_col: 3})).to be true
        expect(white_pawn.move_legal?({from_row: 2, from_col: 3, to_row: 4, to_col: 3})).to be true
        expect(white_pawn.move_legal?({from_row: 5, from_col: 3, to_row: 6, to_col: 3})).to be true
        expect(black_pawn.move_legal?({from_row: 7, from_col: 3, to_row: 5, to_col: 3})).to be true
        expect(black_pawn.move_legal?({from_row: 7, from_col: 6, to_row: 6, to_col: 6})).to be true
        expect(black_pawn.move_legal?({from_row: 6, from_col: 3, to_row: 5, to_col: 3})).to be true
      end
    end
    describe '#capture_legal?' do
      it 'returns true in a legal capture' do
        expect(white_pawn.capture_legal?({from_row: 2, from_col: 2, to_row: 3, to_col: 3})).to be true
        expect(white_pawn.capture_legal?({from_row: 4, from_col: 3, to_row: 5, to_col: 2})).to be true
        expect(black_pawn.capture_legal?({from_row: 2, from_col: 1, to_row: 1, to_col: 2})).to be true
        expect(black_pawn.capture_legal?({from_row: 4, from_col: 3, to_row: 3, to_col: 2})).to be true
      end
      it 'returns false in an illegal capture' do
        expect(white_pawn.capture_legal?({from_row: 4, from_col: 3, to_row: 5, to_col: 3})).to be false
        expect(black_pawn.capture_legal?({from_row: 2, from_col: 1, to_row: 1, to_col: 3})).to be false
      end
    end
  end
end

describe Bishop do
  let(:bishop) {Bishop.new('black')}
    context 'when asked to' do
      describe '#move_legal?' do
        it 'returns true moving on a diagonal' do
          expect(bishop.move_legal?({from_row: 1, from_col: 2, to_row: 7, to_col: 8})).to be true
          expect(bishop.move_legal?({from_row: 2, from_col: 5, to_row: 6, to_col: 1})).to be true
        end
        #it 'returns illegal moving outside the diagonal'
      end
    #  describe '#capture_legal?'do

    #  end

    end

end

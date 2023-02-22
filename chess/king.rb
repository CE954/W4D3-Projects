require_relative "stepable.rb"
require_relative "piece.rb"

class King < Piece
include Stepable

    def initialize(color, board, pos)
        super
        @symbol = "Ki"
    end

    def move_diffs
        self.KING
    end

end
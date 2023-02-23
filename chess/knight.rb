require_relative "stepable.rb"
require_relative "piece.rb"

class Knight < Piece
include Stepable

    def initialize(color, board, pos)
        super
        @symbol = "H"
    end

    def move_diffs
        self.KNIGHT
    end

end
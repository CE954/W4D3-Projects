require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece
    include Slideable

    attr_reader :symbol
    
    def initialize(color, board, pos)
        super
        @symbol = "Q"
    end

    def move_dirs
        HORIZONTAL + DIAGONAL
    end
end

queen = Queen.new("W", "_", [0,0])
p queen.to_s
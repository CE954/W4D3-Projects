require_relative "piece.rb"
require_relative "slideable.rb"
class Bishop < Piece
    include Slideable

    attr_reader :symbol
    
    def initialize(color, board, pos)
        super
        @symbol = "B"
    end

    def move_dirs
        DIAGONAL
    end
end
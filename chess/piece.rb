class Piece
    attr_reader :position, :color
    def initialize(color, board, pos)
        @color = color
        @position = [pos]
        @board = board
    end

    def valid_move?(pos)
        x, y = pos 
        x.between?(0,7) && y.between?(0,7) 
        # new_pos = @MOVES.map { |(dx, dy)| [x + dx, y + dy] }
        # new_pos.filter { |(x, y)| x.between?(0,7) && y.between?(0,7) }
    end

end
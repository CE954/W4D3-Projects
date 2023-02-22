class Piece
    attr_reader :position, :color, :symbol
    def initialize(color, board, pos)
        @color = color
        @position = [pos]
        @board = board
        @symbol = "X"
    end

    def valid_move?(pos)
        x, y = pos 
        x.between?(0,7) && y.between?(0,7) 
    end

    def to_s
        self.color + self.symbol
    end

end


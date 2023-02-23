# require_relative "slideable.rb"
# require_relative "stepable.rb"

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

    def move_into_check(pos)
        #move into check?(pos)
        # deep dup board
        # on test board move piece from current position to end positon < mpve piece
        # is the king in check
        # checking piece to be in check 
        # 
    end

    def valid_moves
        # look throw all possible moves
        # only keep ones that arent putting king 

    end
    
    def to_s
        self.color + self.symbol
    end

end


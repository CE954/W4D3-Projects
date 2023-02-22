require_relative "piece.rb"

class Pawn < Piece

    # MOVES = [[]]
    #  [-1, 0] up [-1, -1] diagonal left [-1, 1] diagonal right
    #  [1, 0] down [1, 1] daigonal bottom right [1, -1] diagonal bottom left

    def initialize(color, board, pos)
        super
        @symbol = "P"
    end

    def moves
        self.forward_steps + self.side_attacks
    end

    private

    def at_start_row?
        x, y = self.position[-1]
        x == 1 || x == 6
    end

    def forward_dir
        x, y = self.position[0]
        if  x == 1
            return -1
        elsif x == 6
            return 1
        end
    end

    def forward_steps
        if self.forward_dir == -1
            dx, dy = [1, 0]
            c_pos = @position[-1]
            x, y = c_pos
            return [x + dx, y + dy] 
        elsif self.forward_dir == 1
            dx, dy = [-1, 0]
            c_pos = @position[-1]
            x, y = c_pos
            return [x + dx, y + dy] 
        end
        # [[]]
    end

    def side_attacks
    
        # [[],[]]
    end

end
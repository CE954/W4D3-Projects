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
        result = []

        if self.forward_dir == -1
            dx, dy = [1, 0]
            c_pos = @position[-1]
            x, y = c_pos
            result << [x + dx, y + dy] 
            if self.at_start_row?
                result << [x + (dx * 2), y + dy] 
            end
        elsif self.forward_dir == 1
            dx, dy = [-1, 0]
            c_pos = @position[-1]
            x, y = c_pos
            result << [x + dx, y + dy] 
            if self.at_start_row?
                result << [x + (dx * 2), y + dy] 
            end
        end
        #  check that spaces are valid to move in 
       result.select { |pos| valid_move?(pos)  && @board[pos].instance_of?(NullPiece)} 
    end

    def side_attacks
        results = []
         if self.forward_dir == -1
            diagonal = [[-1, -1], [-1, 1]] 
            c_pos = @position[-1]
            x, y = c_pos
            daigonal.each do |(dx, dy)|
                result << [x + dx, y + dy]
            end 
        elsif self.forward_dir == 1
            diagonal = [[1, 1], [1, -1]]
             c_pos = @position[-1]
            x, y = c_pos
            daigonal.each do |(dx, dy)|
                result << [x + dx, y + dy]
            end 
        end
        result.select { |pos| valid_move?(pos) && @board[pos].color != self.color } 
    end

end
module Stepable

    attr_reader :KNIGHT, :KING

    KNIGHT = [[-2, 1], [-2, -1], 
            [-1, 2], [-1, -2], 
            [1, -2], [1, 2], 
            [2, -1], [2, 1]]

    KING = [[-1, -1], [1, 1]
            [-1, 0], [0, -1]
            [1, -1], [-1, 1]
            [0, 1], [1, 0]]
    
    def moves
        arr = []
        prev_pos = self.position[-1]
        x, y = self.position[-1]
        self.move_diffs.each do |(dx, dy)|
            new_pos = [x + dx, y + dy] 
            arr << new_pos if valid_move?(new_pos)  && @board[new_pos].instance_of?(NullPiece) || @board[new_pos].color != self.color
        end
        arr
    end

    def move_diffs

    end

end
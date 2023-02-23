

module Slideable
    DIAGONAL = [[-1,-1], [1, 1], [-1, 1], [1,-1]]
    HORIZONTAL = [[-1, 0], [0, -1], [0, 1], [1, 0]]

    def moves
        all_possible_pos = [] 
        self.moves_dirs.each do |(dx, dy)| 
            all_possible_pos += grow_unblocked_moves(dx, dy)
        end
           #[x + dx, y + dy] } #passing in grow unblocked moves
        # unblocked moves return and array that filters out moves behind blocked posiitons
        all_possible_pos
    end

    private

    def move_dirs
        # set method to move set used
        # makes an array of full pos
        # ie rook will have horizontal
    end

    def grow_unblocked_moves(dx, dy)
        moves = []
        prev_pos = self.position[-1]
        x, y = self.position[-1]
        c_pos = [x + dx, y + dy]
        while valid_move?(c_pos) && @board[c_pos].instance_of?(NullPiece) || @board[c_pos].color != self.color
            moves << c_pos
            a, b = c_pos
            c_pos = [a + dx, b + dy]
        end
        moves
    end

end
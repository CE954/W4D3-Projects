require_relative "piece.rb"
require "byebug"
require_relative "null_piece.rb"
class Board 
    attr_reader :board
    def initialize
        @board = Array.new(8) {Array.new(8)}

    end

    def set_board
        null = NullPiece.instance
        (0...@board.length).each do |x|
            (0...@board.length).each do |y|
                if x.between?(2,5)
                    @board[x][y] = null
                elsif x.between?(0,1) 
                    @board[x][y] = Piece.new(:B, self, [x,y])
                else
                    @board[x][y] = Piece.new(:W, self, [x,y])
                end
            end 
        end
    end

    def []=(pos, value)
        # debugger
        x,y = pos 
        @board[x][y] = value
    end

    def [](pos)
        x,y = pos 
        @board[x][y] 
    end

    def move_piece(start_pos, end_pos) 
        # if @board[start_pos].nil? 
        #     raise "No piece at position" 
        # elsif !@board[end_pos].valid_move? 
        #     raise "Not a valid move"
        # end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil 
    end

    def print

        @board.map do |row|
            row.map do |el|
                p el.color
            end
        end
    end

end

board = Board.new 
board.set_board 
p board.board
p board.move_piece([1,1], [2,0])
# p board.board
p board.print

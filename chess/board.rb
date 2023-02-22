require_relative "piece.rb"
require "byebug"
require_relative "null_piece.rb"
class Board 
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null = NullPiece.instance
    end

    def set_board
        # null = NullPiece.instance
        (0...@grid.length).each do |x|
            (0...@grid.length).each do |y|
                if x.between?(2,5)
                    @grid[x][y] = @null
                elsif x.between?(0,1) 
                    @grid[x][y] = Piece.new("B", self, [x,y])
                else
                    @grid[x][y] = Piece.new("W", self, [x,y])
                end
            end 
        end
    end

    def []=(pos, value)
        # debugger
        x,y = pos 
        @grid[x][y] = value
    end

    def [](pos)
        x,y = pos 
        @grid[x][y] 
    end

    def move_piece(start_pos, end_pos) 
        # if @grid[start_pos].nil? 
        #     raise "No piece at position" 
        # elsif !@grid[end_pos].valid_move? 
        #     raise "Not a valid move"
        # end

        self[end_pos] = self[start_pos]
        self[start_pos] = @null
    end

    def print
        @grid.map do |row|
            row.map { |ele| ele.color }.join(" ")
        end
    end

     def valid_pos?(pos)
        x, y = pos 
        x.between?(0,7) && y.between?(0,7) 
    end
end

# board = Board.new 
# board.set_board 
# # p board.board
# # p board.move_piece([1,1], [2,0])
# # p board.board
# p board.print

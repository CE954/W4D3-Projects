
require "byebug"
require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "rook.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "pawn.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "slideable.rb"
require_relative "stepable.rb"



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
                if [x, y] == [0,0] || [x, y] == [0, 7]
                    @grid[x][y] = Rook.new("B", self, [x,y])
                elsif [x, y] == [7,0] || [x, y] == [7, 7]
                    @grid[x][y] = Rook.new("W", self, [x,y])
                elsif [x, y] == [0, 1] || [x, y] == [0, 6]
                    @grid[x][y] = Knight.new("B", self, [x,y])
                elsif [x, y] == [7,1] || [x, y] == [7, 6]
                    @grid[x][y] = Knight.new("W", self, [x,y])
                elsif [x, y] == [0, 2] || [x, y] == [0, 5]
                    @grid[x][y] = Bishop.new("B", self, [x,y])
                elsif [x, y] == [7, 2] || [x, y] == [7, 5]
                    @grid[x][y] = Bishop.new("W", self, [x,y])
                elsif [x, y] == [0, 3]
                    @grid[x][y] = Queen.new("B", self, [x,y])
                elsif [x, y] == [7, 3]
                    @grid[x][y] = Queen.new("W", self, [x,y])
                elsif [x, y] == [0, 4]
                    @grid[x][y] = King.new("B", self, [x,y])
                elsif [x, y] == [7, 4]
                    @grid[x][y] = King.new("W", self, [x,y])
                elsif x.between?(2,5)
                    @grid[x][y] = @null
                elsif x == 1 
                    @grid[x][y] = Pawn.new("B", self, [x,y])
                elsif x == 6
                     @grid[x][y] = Pawn.new("W", self, [x,y])
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
        # update pieces positon in attribute
        self[end_pos].position << end_pos
    end

    def print
        @grid.map do |row|
            row.map { |ele| ele.to_s }.join(" ")
        end
    end

     def valid_pos?(pos)
        x, y = pos 
        x.between?(0,7) && y.between?(0,7) 
    end

    def in_check?(color)
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j].instance_of?(King) &&  @grid[i][j].color == color
                    king_pos = @grid[i][j].position[-1]
                end
            end
        end
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if  @grid[i][j].color != color &&  @grid[i][j].moves.include?(king_pos)
                    return true
                end 
            end
        end
        false
    end

    # possibly make hash with type as key and obj as value


    def pieces
        # iterate through all rows
        # reject all nullpieces
        # .flatten
        # collect objs and postions
    end

    def checkmate?(color)
        return false if !in_check?(color) 

        (0...@grid).each do |i|
            (0...@grid).each do |j|

            end
        end

    
    end
end

if $PROGRAM_NAME ==  __FILE__

board = Board.new 
board.set_board 
# # p board.board
# # p board.move_piece([1,1], [2,0])
# # p board.board
p board.print

end
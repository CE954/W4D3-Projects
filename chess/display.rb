require_relative "cursor.rb"
require_relative "board.rb"
require "colorize"

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board #Board.new
        @cursor = Cursor.new([0,0], board)
    end

    def build_grid
        @board.grid.map.with_index do |row, i| 
            build_row(row, i)
        end
    end

    def build_row(row, i) 
        row.map.with_index do |ele, j| 
            color_ops = color_for(i, j) 
            ele.to_s.colorize(color_ops)
        end
    end

    def color_for(i, j)
        if [i, j] == @cursor.cursor_pos && @cursor.selected == true
            bg = :green
        elsif [i, j] == @cursor.cursor_pos
            bg = :light_red
        elsif (i + j).odd? 
            bg = :light_gray
        else  
            bg = :black 
        end
        { background: bg } #color: :white 
    end

    def render 
        system("clear")
        build_grid.each { |row| puts row.join }
    end
end

if $PROGRAM_NAME ==  __FILE__

board = Board.new
board.set_board
display = Display.new(board)
loop do 
    display.render
    start_pos = display.cursor.get_input
    # end_pos = display.cursor.get_input
    # board.make_move(start_pos, end_pos)
end

end
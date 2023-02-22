require_relative "cursor.rb"
require "colorize"

class Display

    def initialize(board)
        @board = Board.new
        @cursor = Cursor.new([0,0], board)
    end
end
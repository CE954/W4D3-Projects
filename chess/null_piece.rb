require_relative "piece.rb"
require "singleton"
class NullPiece < Piece 
    include Singleton
    attr_reader :symbol, :color
    def initialize
        @symbol = " "
        @color = " "
    end

    def moves
        return []
    end
end
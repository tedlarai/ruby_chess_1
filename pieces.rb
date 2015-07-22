class Pieces
  #common methods
end

class Pawn
  def initialize(color)
    @color = color
    if color == "white"
      @icon_code = "\u2659"
    else
      @icon_code = "\u265F"
    end
  end

  def move_legal?(move) #hash keys{:from_row :from_col :from_row :to_col}
    if @color == "white"
      if move[:from_row] == 2#starting position
       (move[:to_row] == move[:from_row] + 1 || move[:to_row] == move[:from_row] + 2) && move[:to_col] == move[:from_col]
      else #moved
        move[:to_row] == move[:from_row] + 1 && move[:to_col] == move[:from_col]
      end
    else #black
      if move[:from_row] == 7 #starting position
        (move[:to_row] == move[:from_row] - 1 || move[:to_row] == move[:from_row] - 2) && move[:to_col] == move[:from_col]
      else #moved
        move[:to_row] == move[:from_row] - 1 && move[:to_col] == move[:from_col]
      end
    end
  end

  def capture_legal?(move)
    if @color == 'white'
      move[:to_row] == move[:from_row] + 1 && (move[:to_col] == move[:from_col] + 1 || move[:to_col] == move[:from_col] - 1)
    else#black
      move[:to_row] == move[:from_row] - 1 && (move[:to_col] == move[:from_col] + 1 || move[:to_col] == move[:from_col] - 1)
    end
  end

end

class Bishop
  def initialize(color)
    @color = color
    if color == "white"
      @icon_code = "\u2657"
    else
      @icon_code = "\u265D"
    end
  end

  def move_legal?(move)
    move[:from_row]-move[:to_row] == move[:from_col]-move[:to_col] || move[:from_row]-move[:to_row] == -(move[:from_col]-move[:to_col])
  end

  def capture_legal?(move)
    move_legal?(move)
  end

end

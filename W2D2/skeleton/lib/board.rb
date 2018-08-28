require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    fill_cups
  end

  def valid_move?(start_pos)
    if start_pos == 6 || start_pos == 13 || !(0..13).include?(start_pos)
      raise RuntimeError, "Invalid starting cup" 
    end
    raise RuntimeError, "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    curr_pos = start_pos
    while num_stones > 0
      curr_pos += 1
      curr_pos %= 14
      if curr_pos == 6
        if current_player_name == @name1
          @cups[6] << :stone 
        else
          curr_pos +=1
          curr_pos %= 14
          @cups[curr_pos] << :stone
        end
      elsif curr_pos == 13
        if current_player_name == @name2
          @cups[13] << :stone 
        else
          curr_pos +=1
          curr_pos %= 14
          @cups[curr_pos] << :stone
        end
      else
        @cups[curr_pos] << :stone
      end
      num_stones -= 1
    end
    self.render
    self.next_turn(curr_pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
      ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? {|el| el.empty?} || @cups[6..12].all? {|el| el.empty?}
      return true
    end
    return false
  end

  def winner
    return @name1 if @cups[6].length > @cups[13].length
    return @name2 if @cups[6].length < @cups[13].length
    return :draw
  end
  
  private
  def fill_cups
    @cups = Array.new(14) {[:stone]*4}
    @cups[6] = []
    @cups[13] = []
  end
    
end


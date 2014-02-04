 class DiceSet
  attr_accessor :values

  def initialize
  	@values = []
  end
  
  def roll(n)
  	@values = []
    n.times { @values << 1 + rand(6) }
  end
 end

 dice = DiceSet.new

 dice.roll(5)
 p first_time = dice.values

 dice.roll(5)
 p second_time = dice.values
def score(dice)
  points = 0
  if dice.include?(1)
  	ones_arr = dice.select { |x| x == 1 }
  	while ones_arr.length > 0
  		if ones_arr.length >= 3
  			ones_arr.slice!(0,3)
  			points += 1000
  		else
  			points += ones_arr.length * 100
        break
  		end 
  	end
  	dice.delete(1)
  end

  if dice.include?(5)
  	fives_arr = dice.select { |x| x == 5 }
  	while fives_arr.length > 0
  		if fives_arr.length >= 3
  			fives_arr.slice!(0,3)
  			points += 500
  		else
  			points += (fives_arr.length * 50)
  			break
  		end
  	end
    dice.delete(5)
  end

  dice.each do |n|
    others_arr = dice.select { |x| x == n }
    while others_arr.length > 0
      if dice.count(n) >= 3
        others_arr.slice!(0,3)
        points += n * 100
      else
        break
      end
    end
    dice.delete(n)
  end
  p points
end

score [2,2,2]
puts "guess a number between 0 and 99"
lbound = 0
ubound = 99
tries = 0
range_above = 0
range_below = 99

guess = gets.to_i

while ubound - lbound > 1
    tries += 1
    puts "CHEATER!" if guess < 0 || guess > 99
    range_above = ubound - guess
    range_below = guess - lbound
    
    lbound = guess + 1 if range_above > range_below && range_below > 0
    ubound = guess - 1 if range_above <= range_below && range_above > 0
    puts "num is #{ range_above > range_below ? 'higher' : 'lower'}"

    puts "[#{lbound},#{ubound}] [#{range_above},#{range_below}]"
    guess = gets.to_i
end

puts "you win! only took #{tries} tries"
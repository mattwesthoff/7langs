puts "guess a number between 0 and 99"
lbound = 0
ubound = 99
tries = 0

while
    tries += 1
    guess = Integer(gets)
    if guess < 0 || guess > 99
        puts "CHEATER!"
        exit
    end

    range_above = ubound - guess
    range_below = guess - lbound
    if range_above < 0 then
        puts "num is lower"
    elsif range_below < 0 then
        puts "num is higher"
    elsif range_above + range_below <= 1 then
        puts "you win! only took #{tries} tries"
        exit
    elsif range_above > range_below
        puts "num is higher"
        lbound = guess + 1
    else
        puts "num is lower"
        ubound = guess - 1
    end

end
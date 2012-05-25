a = (1..16).to_a()

#just each
out = []
a.each do |n|
    out.push(n)
    if out.length == 4 then
        p out
        out = []
    end
end

#slice
a.each_slice(4) {|n| p n }
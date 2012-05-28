regex = /a/
file = "test.txt"

File.readlines(file).each_with_index { |l,i| puts "#{i+1}: #{l}" if l =~ regex }
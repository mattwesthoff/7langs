#these could be inputs
regex = /a/
file = "test.txt"

raise IOError, "Couldn't find file: #{file}" unless File.file?(file)
File.readlines(file).each_with_index { |l,i| puts "#{i+1}: #{l}" if l =~ regex }
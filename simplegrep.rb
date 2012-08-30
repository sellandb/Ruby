def simple_grep(filename, phrase)
i = 0
myPhrase = Regexp.new(phrase)
File.new(filename).readlines.each do |x|
	i += 1
	puts "#{i}: #{x}" if myPhrase.match(x)
end
end

simple_grep(ARGV[0], ARGV[1])
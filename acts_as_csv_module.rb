module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
	
	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end
	
	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + ".txt"
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
			
			file.each do |row|
				@csv_contents << CsvRow.new(headers, row.chomp.split(', '))
			end
		end
		
		def each(&block)
			csv_contents.each(&block)
		end
		attr_accessor :headers, :csv_contents
		
		def initialize
			read
		end
		
	end
end
class CsvRow
	attr_accessor :headers, :contents
	
	def initialize(header, row)
		@headers = header
		@contents = row
	end
	
	def method_missing name, *args
		col = name.to_s
		index = headers.index(col)
		return contents[index]
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

m = RubyCsv.new

puts "Row One"
m.each {|row| puts row.one}

puts "\n\nRow Two"
m.each {|row| puts row.two}

puts "\n\nRow Three"
m.each {|row| puts row.three}

puts "\n\nRow Four"
m.each {|row| puts row.four}

puts "\n\nRow Five"
m.each {|row| puts row.five}
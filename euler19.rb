$Months = [31,28,31,30,31,30,31,31,30,31,30,31]
$MonthsLeap = [31,29,31,30,31,30,31,31,30,31,30,31]

def isLeapYear(year)
	if((year % 100) + (year % 400) == 0)
		return true
	end
	if(((year % 100) != 0) && ((year % 4) == 0))
		return true
	end
	return false
end

#1901 starts on a tuesday

def countSundaysYear(year, startDay)
	sundays = 0
	day = startDay % 7
	if(isLeapYear(year))
		year = $MonthsLeap
	else
		year = $Months
	end
	
	year.each do |x|
		if(day == 0)
			sundays += 1
		end
		day = ((day + x) % 7)
		
	end
	
	return sundays
end

$startDay = 2

output = (1901..2000).reduce(0) do |sum,val|
	day = $startDay
	year = 365
	if(isLeapYear(val))
		year = 366
	end
	$startDay = ((day + year) % 7)
	puts val.to_s + " starts on " + day.to_s + " and has " + countSundaysYear(val, day).to_s + " starts"
	sum + countSundaysYear(val, day)
end

puts output
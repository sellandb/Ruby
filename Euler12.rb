def getTriangleNum(num)
	number = 0
	(0..num).each{|x| number += x}
	return number
end

def numOfDiv(num)
	root = Math.sqrt(num)
	divs = []
	(1..root.to_i).each do |x|
		if((num.to_f / x.to_f).floor == (num.to_f / x.to_f))
			divs.push(x)
			divs.push(num/x)
		end
	end
	#puts divs
	return divs.count
end

# (1..8).each do |x|
	# puts "Number"
	# puts getTriangleNum(x)
	# puts numOfDiv(getTriangleNum(x))
# end


$currentNum = 1
$currentTri = 1
while(($currentTri = numOfDiv(getTriangleNum($currentNum))) < 5)
	$currentNum += 1
	if($currentTri > 150)
		puts "Testing: " + $currentTri.to_s
	end
end
puts $currentNum
			
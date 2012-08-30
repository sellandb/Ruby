def getEvenDivisors(x)
	divisors = [1]
	upperLimit = (x ** 0.5).to_i + 1
	(2..upperLimit).each do |y|
		if((x.to_f / y.to_f) == (x / y).to_f)
			divisors.push(y)
			divisors.push(x/y)
		end
	end
	
	return divisors
end

def buildDivisorSumList(max)
	list = Hash.new()
	(3..max).each do |x|
		list[x] = getEvenDivisors(x).reduce(0) do |s,v|
			s+v
		end
	end
	return list
end

$list = buildDivisorSumList(9999)
$amicablePairs = []

$list.each do |k,v|
	if($list[v] == k && (v != k))
		$amicablePairs.push(k)
		$amicablePairs.push(v)
	end
end

$output = $amicablePairs.uniq.reduce(0) do |s,v|
	s + v
end

puts $output
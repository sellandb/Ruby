$primeList = [2,3,5,7];

def getNextPrime
	current = $primeList[-1]
	current += 2
	
	while not isPrime(current)
	current += 2
	end
	
	$primeList.push(current)
	puts current.to_s + " : " + $primeList.count.to_s
end

def isPrime(number)
	root = Math.sqrt(number)
	
	toCheck = $primeList.select {|i| i <= root}
	
	prime = toCheck.select {|i| (number.to_f / i.to_f).floor == (number.to_f / i.to_f)}
	
	return prime.count == 0
end

getNextPrime() while $primeList.count <= 10000


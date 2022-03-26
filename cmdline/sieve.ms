// Sieve of Eratosthenes algorithm for finding prime numbers.
// Note that there are much better algorithms for doing this,
// but this is a pretty standard benchmark.
// http://www.rosettacode.org/wiki/Sieve_of_Eratosthenes

primes = function(limit)
	isPrime = [true] * (limit+1)
	for n in range(2, sqrt(limit))
		if not isPrime[n] then continue
		for k in range(n*n, limit, n)
			isPrime[k] =  false
		end for
	end for
	result = []
	for n in range(2, limit)
		if isPrime[n] then result.push n
	end for
	return result
end function

runTest = function
	// find primes up to a million
	x = primes(1000000)
end function

if locals == globals then
	t0 = time
	runTest
	t1 = time
	print t1 - t0
end if


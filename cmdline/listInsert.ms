// This benchmark inserts a bunch of random numbers into a sorted list,
// keeping the list sorted by doing a sequential search for the right
// insert position.  This is of course a silly algorithm (much like
// recursive Fibonacci).  But it does test iteration, list insertion, etc.


list.insertSorted = function(newValue)
	for i in self.indexes
		if newValue < self[i] then
			self.insert i, newValue
			return
		end if
	end for
	self.push newValue
end function

runBenchmark = function(n)
	t0 = time
	myList = []
	i = 0
	while i < n
		myList.insertSorted floor(rnd*10000)
		i = i + 1
	end while
	t1 = time
	print "Benchmark time for n=" + n + ": " + round(t1-t0, 3) + " sec"
end function


if locals == globals then
	runBenchmark 1000
	runBenchmark 3000
	runBenchmark 10000
end if


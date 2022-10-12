f = function
	result = 0
	counter = 0

	while @counter < 3000000
		result = (@result + 1) / 2
		counter = @counter + 1
	end while
end function

runBenchmark = function
	print "Benchmarking: loopMath"
	t0 = time
	f
	t1 = time
	print "  Result: " + round(t1 - t0, 3) + " sec"
	results["loopMath"] = round(t1 - t0, 3)
end function

if locals == globals then
	results = {}
	runBenchmark
end if


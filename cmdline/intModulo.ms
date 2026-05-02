// Benchmark: sum all multiples of 3 or 5 below N (Project Euler #1 style).
// Exercises heavy integer modulo in a tight loop with no float involvement.

runBenchmark = function(n = 3000000)
	t0 = time
	sum = 0
	i = 1
	while i < n
		if i % 3 == 0 or i % 5 == 0 then sum += i
		i += 1
	end while
	t1 = time
	elapsed = round(t1 - t0, 3)
	print "intModulo (n=" + n + "): " + elapsed + " sec  (sum=" + sum + ")"
	results["intModulo(" + n + ")"] = elapsed
end function

if locals == globals then
	results = {}
	runBenchmark
end if

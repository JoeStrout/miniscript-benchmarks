// Benchmark: compute the dot product of two large lists, float vs int variant.
// Lists are initialized from sin/cos * 1000; the int variant applies floor.
// The inner loop exercises list reads and multiply-add on numeric values.

runBenchmark = function(n = 100000, reps = 10)
	a = [0] * n
	b = [0] * n

	timeIt = function(label, key, op)
		t0 = time
		rep = 0
		while rep < reps
			op
			rep += 1
		end while
		elapsed = round(time - t0, 3)
		print label + ": " + elapsed + " sec"
		results[key] = elapsed
	end function

	dotOp = function
		total = 0
		i = 0
		while i < n
			total += a[i] * b[i]
			i += 1
		end while
	end function

	// Float version
	i = 0
	while i < n
		a[i] = sin(i) * 1000
		b[i] = cos(i) * 1000
		i += 1
	end while
	timeIt "dotProduct.float (n=" + n + ", reps=" + reps + ")", "dotProduct.float(" + n + ")", @dotOp

	// Int version
	i = 0
	while i < n
		a[i] = floor(sin(i) * 1000)
		b[i] = floor(cos(i) * 1000)
		i += 1
	end while
	timeIt "dotProduct.int   (n=" + n + ", reps=" + reps + ")", "dotProduct.int(" + n + ")", @dotOp
end function

if locals == globals then
	results = {}
	runBenchmark
end if

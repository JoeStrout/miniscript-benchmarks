// Benchmark: call .sum on a large list, comparing integer vs float values.

runBenchmark = function(n = 1000000, reps = 100)
	data = [0] * n

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

	sumOp = function; s = data.sum; end function

	// Integer version
	i = 0
	while i < n
		data[i] = i
		i += 1
	end while
	timeIt "listSum.int   (n=" + n + ", reps=" + reps + ")", "listSum.int(" + n + ")", @sumOp

	// Float version
	i = 0
	while i < n
		data[i] = i * 0.1
		i += 1
	end while
	timeIt "listSum.float (n=" + n + ", reps=" + reps + ")", "listSum.float(" + n + ")", @sumOp
end function

if locals == globals then
	results = {}
	runBenchmark
end if

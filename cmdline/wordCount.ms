// Count the frequency of each unique word in the input file,
// then find the most common word.

getWordCounts = function(data, delimiter=" ")
	counts = {}
	words = data.split(delimiter)
	for w in words
		if counts.hasIndex(w) then
			counts[w] = counts[w] + 1
		else
			counts[w] = 1
		end if
	end for
	
	bestWord = null
	bestCount = 0
	for kv in counts
		if kv.value > bestCount then
			bestWord = kv.key
			bestCount = kv.value
		end if
	end for
	return counts.len + " unique words; most common is """ + bestWord + 
	  """ which occurs " + bestCount + " times."
end function

runBenchmark = function(inputFilePath="../inputData/loremipsum.txt")
	print "Benchmarking: " + inputFilePath
	t0 = time
	f = file.open(inputFilePath, "r")
	if f == null then
		print "Unable to read file"
		return
	end if
	data = f.read
	f.close
	t1 = time
	result = getWordCounts(data)
	t2 = time
	print "   File read time: " + round(t1 - t0, 3) + " sec"
	print "   getWordCounts time: " + round(t2 - t1, 3) + " sec"
	print "   Result: " + result
	results.wordCount = round(t2 - t1, 3)
end function

if locals == globals then
	results = {}
	runBenchmark "../inputData/loremipsum.txt"
end if




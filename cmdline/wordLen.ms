// Count the number of words of each length in the input file.

getWordLengths = function(data, delimiter=" ")
	result = {}
	words = data.split(delimiter)
	for w in words
		len = w.len
		if result.hasIndex(len) then
			result[len] = result[len] + 1
		else
			result[len] = 1
		end if
	end for
	return result
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
	result = getWordLengths(data)
	t2 = time
	print "   File read time: " + round(t1 - t0, 3) + " sec"
	print "   getWordLengths time: " + round(t2 - t1, 3) + " sec"
	print "   Result: " + result
	results.wordLen = round(t2 - t1, 3)
end function

if locals == globals then
	results = {}
	runBenchmark "../inputData/loremipsum.txt"
end if




// Capitalize each word in the input file.

string.titleCase = function(delimiter=" ")
	words = self.split(delimiter)
	for i in words.indexes
		if i == 0 or i == words.len-1 or smallWords.indexOf(words[i]) == null then
			words[i] = words[i].capitalized
		end if
	end for
	return words.join(delimiter)
end function

runBenchmark = function(inputFilePath)
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
	result = data.titleCase
	t2 = time
	print "   File read time: " + round(t1 - t0, 3) + " sec"
	print "   titleCase time: " + round(t2 - t1, 3) + " sec"
end function

if locals == globals then
	runBenchmark "../inputData/loremipsum.txt"
end if




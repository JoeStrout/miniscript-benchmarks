// Capitalize each word in the input file (except for certain small words).

string.capitalized = function
	if self.len < 2 then return self.upper
	return self[0].upper + self[1:]
end function

smallWords = ["a", "an", "the", "at", "by", "for", "in", "of", "on", "to", "up", "and", "as", "but", "or", "nor"]

string.titleCase = function(delimiter=" ")
	words = self.split(delimiter)
	for i in words.indexes
		if i == 0 or i == words.len-1 or smallWords.indexOf(words[i]) == null then
			words[i] = words[i].capitalized
		end if
	end for
	return words.join(delimiter)
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
	result = data.titleCase
	t2 = time
	print "   File read time: " + round(t1 - t0, 3) + " sec"
	print "   titleCase time: " + round(t2 - t1, 3) + " sec"
	results["titleCase(" + file.name(inputFilePath) + ")"] = round(t2 - t1, 3)
end function

if locals == globals then
	results = {}
	runBenchmark "../inputData/loremipsum.txt"
end if




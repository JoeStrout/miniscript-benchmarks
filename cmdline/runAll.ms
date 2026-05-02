filenames = file.children
filenames.sort
for i in range(filenames.len-1, 0, -1)
	if filenames[i].len < 3 or filenames[i][-3:] != ".ms" or filenames[i] == "runAll.ms" then
		filenames.remove i
	end if
end for

results = {}
for i in filenames.indexes
	name = filenames[i]
	strippedName = name - ".ms"
	print
	print "(" + (i+1) + "/" + filenames.len + ") " + name + ":"
	import strippedName
	locals[strippedName].runBenchmark
end for

print
print
print "MiniScript " + version.miniscript + ", " + version.hostName + " " + version.host

keys = results.indexes
keys.sort
for k in keys
	print (k + " "*30)[:30] + " : " + results[k]
end for

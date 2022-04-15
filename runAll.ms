results = {}
file.setdir "cmdline"
for name in file.children
	if name.len < 3 or name[-3:] != ".ms" then continue
	strippedName = name - ".ms"
	print
	print name + ":"
	import strippedName
	locals[strippedName].runBenchmark
end for

print
print

keys = results.indexes
keys.sort
for k in keys
	print (k + " "*30)[:30] + " : " + results[k]
end for

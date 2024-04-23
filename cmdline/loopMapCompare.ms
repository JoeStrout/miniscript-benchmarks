// This benchmark is testing two maps for equality, where both
// maps contain a loop.  This is a bit of a pathological case,
// since if MiniScript recurses down sub-trees and doesn't realize
// there is a loop, it could take quite a while.

runBenchmark = function
	print "Benchmarking: loopMapCompare"
	globals.mapA = {}
	mapA.child1 = {}
	mapA.child2 = {}
	mapA.child1.parent = mapA
	mapA.child1.sibling = mapA.child2
	mapA.child2.parent = mapA
	mapA.child2.sibling = mapA.child1
	
	globals.mapB = {}
	mapB.child1 = {}
	mapB.child2 = {}
	mapB.child1.parent = mapB
	mapB.child1.sibling = mapB.child2
	mapB.child2.parent = mapB
	mapB.child2.sibling = mapB.child1
	
	t0 = time
	for i in range(999)
		if mapA != mapB then print "ERROR: should be equal"
	end for
	t1 = time
	print "  Result: " + round(t1 - t0, 3) + " sec"
	results["loopMapCompare"] = round(t1 - t0, 3)
end function

if locals == globals then
	results = {}
	runBenchmark
end if


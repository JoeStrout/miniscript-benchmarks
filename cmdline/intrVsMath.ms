// Testing bitAnd intrinsic vs math (%)
// bitAnd(x, 255) == x % 256, mathematically, but not necessarily in performance.
// This is useful for 8-bit operations, such as when emulating a 6502.

runBenchmark = function(n=65536)
    tStart = time
    for i in range(n)
        x = bitAnd(i, 255)
    end for
    tEnd = time
    r1 = tEnd - tStart

    tStart = time
    for i in range(n)
        x = i % 256
    end for
    tEnd = time
    r2 = tEnd - tStart

    results["intrVsMath("+n+") (bitAnd)"] = r1
    results["intrVsMath("+n+") (math %)"] = r2
    print "intrVsMath (n=" + n + ") (bitAnd i, 255): " + r1 + " seconds"
    print "intrVsMath (n=" + n + ") (i % 256): " + r2 + " seconds"
end function

if locals == globals then
	results = {}
	runBenchmark
end if


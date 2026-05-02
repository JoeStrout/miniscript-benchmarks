// Recursive Collatz Conjecture
// Wikipedia link to the problem: https://en.wikipedia.org/wiki/Collatz_conjecture

rCollatz = function(n)
    if n == 1 then return true
    if n % 2 then return rCollatz(3*n+1)
    return rCollatz(n/2)
end function

runBenchmark = function(n=15000)
    t0 = time
    x = 2
    for i in range(2, n)
        x = i
        if not rCollatz(n) then continue
    end for
    t1 = time
    print "rCollatz(" + n + ") time: " + round(t1 - t0, 3)
    results["rCollatz(" + n + ")"] = round(t1 - t0, 3)
end function

if locals == globals then
    results = {}
    runBenchmark
end if

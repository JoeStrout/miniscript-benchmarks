// Recursive Fibonacci sequence.


rfib = function(n)
    if n < 1 then return 0
    if n == 1 then return 1
    return rfib(n-1) + rfib(n-2)
end function

runTest = function
	x = rfib(30)
end function

if locals == globals then
	t0 = time
	runTest
	t1 = time
	print t1 - t0
end if


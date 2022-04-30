// This benchmark generates a pixel fountain.


Point = {}
Point.x = 0
Point.y = 0
Point.vx = 0
Point.vy = 0
Point.color = color.white
Point.update = function
	gfx.setPixel self.x, self.y, color.black
	self.x = self.x + self.vx
	self.y = self.y + self.vy
	self.vy = self.vy - 1
	gfx.setPixel self.x, self.y, self.color
end function

runBenchmark = function
	clear
	t0 = time
	points = []
	colors = [color.yellow, color.aqua, color.green, color.lime, color.pink, color.white]
	for iteration in range(499)		
		// create some new points
		for i in range(20)
			p = new Point
			p.vx = 5 + rnd*10
			p.vy = 20 + rnd*20
			p.color = colors[rnd * colors.len]
			points.push p
		end for
		
		// update all points, removing any that have fallen off screen
		for i in range(points.len-1)
			points[i].update
			if points[i].y < 0 then points.remove i
		end for

		// note that we do NOT yield here in our loop, because doing so
		// would ruin the benchmark.
	end for
	t1 = time
	print "fountain: " + round(t1 - t0, 3) + " sec"
	results.fountain = round(t1 - t0, 3)
end function

if locals == globals then
	results = {}
	runBenchmark
end if

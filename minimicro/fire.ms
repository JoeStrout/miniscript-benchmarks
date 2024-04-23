// DOOM style fire effect.  Reference:
// https://fabiensanglard.net/doom_fire_psx/

SCALE = 4
HEIGHT = 640/SCALE
WIDTH = 960/SCALE

runBenchmark = function
	clear
	
	display(4).mode = displayMode.tile
	td = display(4)
	td.tileSet = file.loadImage("palette.png")
	td.tileSetTileSize = 8
	td.cellSize = SCALE
	td.extent = [WIDTH, HEIGHT]
	td.clear 0
	
	xrange = range(0, WIDTH-1)
	yrange = range(HEIGHT-2, 0)
	
	td.setCell xrange, 0, 36
	
	t0 = time
	maxY = 0
	for iteration in range(49)
		for fromX in xrange
			for fromY in yrange
				idx = floor(rnd * 3)
				toX = fromX - idx + 1
				toY = fromY + 1
				p = td.cell(fromX, fromY) - idx%2
				td.setCell toX, toY, p
			end for	
		end for	
		// note that we do NOT yield here in our loop, because doing so
		// would ruin the benchmark.
	end for
	t1 = time
	print "fire: " + round(t1 - t0, 3) + " sec"
	results.fire = round(t1 - t0, 3)
end function

if locals == globals then
	results = {}
	runBenchmark
end if

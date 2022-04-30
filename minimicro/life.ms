// Conway's Game of Life
setup = function
	clear
	outer.rows = 64; outer.rowRange = range(0, rows-1)
	outer.cols = 96; outer.colRange = range(0, cols-1)
	// prepare two tile displays (so we can swap between them)
	img = Image.create(2, 1); img.setPixel 1, 0, color.white
	outer.grids = []
	for dispIdx in [4,5]
		display(dispIdx).mode = displayMode.tile
		td = display(dispIdx)
		td.cellSize = 10  // size of cells on screen
		td.extent = [cols, rows]
		td.overlap = -1   // adds a small gap between cells
		td.tileSet = img; td.tileSetTileSize = 1
		td.clear 0
		grids.push td
	end for

	// initialize to a random state
	rnd 42	// (after setting the seed so it's the same every time)
	for x in colRange
		for y in rowRange
			td.setCell x, y, rnd > 0.5
		end for
	end for
	outer.curIdx = 5
end function

// main loop
update = function
	td = grids[curIdx-4]
	newIdx = 4 + (curIdx == 4)
	newTd = grids[newIdx-4]
	for x in colRange
		for y in rowRange
			// get sum of neighboring states
			sum = 0
			for i in [x-1, x, x+1]
				if i < 0 or i >= cols then continue
				for j in [y-1, y, y+1]
					if j < 0 or j >= rows then continue
					if i==x and j==y then continue
					sum = sum + td.cell(i,j)
				end for
			end for
			// Now, update the cell based on current state
			// and neighboring sum.
			if td.cell(x,y) then
				newTd.setCell x, y, (sum == 2 or sum == 3)
			else
				newTd.setCell x, y, sum == 3
			end if
		end for
	end for
	display(newIdx).mode = displayMode.tile
	display(curIdx).mode = displayMode.off
	outer.curIdx = newIdx
end function

runBenchmark = function
	setup
	t0 = time
	for i in range(24)
		update
	end for
	t1 = time
	print "life: " + round(t1 - t0, 3) + " sec"
	results.life = round(t1 - t0, 3)
end function

if locals == outer then
	results = {}
	runBenchmark
end if

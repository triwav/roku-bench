sub init()
	m.rect1 = m.top.findNode("rect1")
	m.rect2 = m.top.findNode("rect2")
	m.rect3 = m.top.findNode("rect3")

	' versions = [
	' 	{
	' 		"name": "boundingRect"
	' 		"func": function(context)
	' 			m = getGlobalAA()
	' 			total = 0
	' 			total += m.rect1.boundingRect().width
	' 			total += m.rect2.boundingRect().height
	' 			total += m.rect3.boundingRect().width
	' 			return total
	' 		end function
	' 	}, {
	' 		"name": "localBoundingRect"
	' 		"func": function(context)
	' 			m = getGlobalAA()
	' 			total = 0
	' 			total += m.rect1.localBoundingRect().width
	' 			total += m.rect2.localBoundingRect().height
	' 			total += m.rect3.localBoundingRect().width
	' 			return total
	' 		end function
	' 	}, {
	' 		"name": "sceneBoundingRect"
	' 		"func": function(context)
	' 			m = getGlobalAA()
	' 			total = 0
	' 			total += m.rect1.sceneBoundingRect().width
	' 			total += m.rect2.sceneBoundingRect().height
	' 			total += m.rect3.sceneBoundingRect().width
	' 			return total
	' 		end function
	' 	}, {
	' 		"name": "field access"
	' 		"func": function(context)
	' 			m = getGlobalAA()
	' 			total = 0
	' 			total += m.rect1.width
	' 			total += m.rect2.height
	' 			total += m.rect3.width
	' 			return total
	' 		end function
	' 	}
	' ]
	' runComparisonBenchmark("get node size options", versions, invalid, 5000, {"operationMultiplier": 3})

	versions = [
		{
			"name": "boundingRect before"
			"func": function(context)
				m = getGlobalAA()
				total = 0
				total += m.rect1.boundingRect().width
				total += m.rect2.boundingRect().height
				total += m.rect3.boundingRect().width
				return total
			end function
		}, {
			"name": "boundingRect after"
			"func": function(context)
				m = getGlobalAA()
				total = 0
				total += m.rect1.boundingRect().width
				total += m.rect2.boundingRect().height
				total += m.rect3.boundingRect().width
				return total
			end function
		}
	]

	contextFunc = sub(context)
		if context.version.name = "boundingRect after" then
			m = getGlobalAA()
			m.top.getAll()
		end if
	end sub

	runComparisonBenchmark("boundingRect before vs after calling getAll", versions, contextFunc, 5000)

	benchmarksComplete()
end sub

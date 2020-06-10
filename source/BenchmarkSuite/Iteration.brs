function BenchmarkSuite_iterationBenchmarks() as Object
	benchmarks = {}

	context = []
	for i = 0 to 500
		context.push(i.toStr())
	end for

	versions = [
		{
			"name": "for"
			"func": function(context)
				searchFor = "200"
				containsValue = false
				for i = 0 to context.count() - 1
					item = context[i]
					if item = searchFor then
						containsValue = true
					end if
				end for
				return containsValue
			end function
		},{
			"name": "for each"
			"func": function(context)
				searchFor = "200"
				containsValue = false
				for each item in context
					if item = searchFor then
						containsValue = true
					end if
				end for
				return containsValue
			end function
		}
	]
	benchmarks["forVsForEach"] = {
		"name": "for vs for each (1k array)"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 500
	}


	versions = [
		{
			"name": "for"
			"func": function(context)
				searchFor = "200"
				matchingIndex = -1
				for i = 0 to context.count() - 1
					item = context[i]
					if item = searchFor then
						matchingIndex = i
					end if
				end for
				return matchingIndex
			end function
		}, {
			"name": "for each"
			"func": function(context)
				searchFor = "200"
				matchingIndex = -1
				i = 0
				for each item in context
					if item = searchFor then
						matchingIndex = i
					end if
					i++
				end for
				return matchingIndex
			end function
		}
	]
	benchmarks["forVsForEachWithIndex"] = {
		"name": "for vs for each when index is needed (1k array)"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 500
	}


	versions = [
		{
			"name": "for step -1"
			"func": function(context)
				t = 0
				for i = context.count() - 1 to 0 step -1
					t++
				end for
				return t
			end function
		}, {
			"name": "reversed for each"
			"func": function(context)
				t = 0
				context.reverse()
				for each item in context
					t++
				end for
				return t
			end function
		}
	]
	benchmarks["reverseIteration"] = {
		"name": "reverse iteration"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 500
	}
	return benchmarks
end function

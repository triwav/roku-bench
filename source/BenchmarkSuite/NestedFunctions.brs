function BenchmarkSuite_nestedFunctionBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "one level"
			"func": function(context)
				m.levelOne = sub()
					' Does nothing
				end sub
				m.levelOne()
			end function
		}, {
			"name": "two levels"
			"func": function(context)
				m.levelTwo = sub()
					' Does nothing
				end sub
				m.levelOne = sub()
					m.levelTwo()
				end sub
				m.levelOne()
			end function
		}, {
			"name": "three levels"
			"func": function(context)
				m.levelThree = sub()
					' Does nothing
				end sub
				m.levelTwo = sub()
					m.levelThree()
				end sub
				m.levelOne = sub()
					m.levelTwo()
				end sub
				m.levelOne()
			end function
		}, {
			"name": "four levels"
			"func": function(context)
				m.levelFour = sub()
					' Does nothing
				end sub
				m.levelThree = sub()
					m.levelFour()
				end sub
				m.levelTwo = sub()
					m.levelThree()
				end sub
				m.levelOne = sub()
					m.levelTwo()
				end sub
				m.levelOne()
			end function
		}
	]
	benchmarks["nestedFunctions"] = {
		"name": "Test to see if nested functions hurt performance the same amount"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 50000
	}

	return benchmarks
end function

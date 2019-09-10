function BenchmarkSuite_operatorBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "i += 1"
			"func": function(context)
				i = 0
				for _ = 0 to 1000
					i += 1
				end for
				return i
			end function
		}, {
			"name": "i++"
			"func": function(context)
				i = 0
				for _ = 0 to 1000
					i++
				end for
				return i
			end function
		}
	]
	benchmarks["plusOne"] = {
		"name": "plus one (1k times)"
		"versions": versions
		"contextOrContextFunc": Invalid,
		"iterations": 1000
	}

	versions = [
		{
			"name": "division"
			"func": function(context)
				return context * 0.5
			end function
		}, {
			"name": "multiplication"
			"func": function(context)
				return context / 2
			end function
		}
	]
	benchmarks["divisionVsMultiplication"] = {
		"name": "division vs multiplication"
		"versions": versions
		"contextOrContextFunc": 1920,
		"iterations": 100000
	}

	versions = [
		{
			"name": "equal"
			"func": function(context)
				return context = 5
			end function
		}, {
			"name": "not equal"
			"func": function(context)
				return context <> 5
			end function
		}
	]
	benchmarks["equalVsNotEqual"] = {
		"name": "division vs multiplication"
		"versions": versions
		"contextOrContextFunc": 1,
		"iterations": 500000
	}


	versions = [
		{
			"name": "i = i + x"
			"func": function(context)
				i = 0
				for _ = 0 to 1000
					i = i + 2
				end for
				return i
			end function
		}, {
			"name": "i += 2"
			"func": function(context)
				i = 0
				for _ = 0 to 1000
					i += 2
				end for
				return i
			end function
		}
	]
	benchmarks["plusTwo"] = {
		"name": "plus two (1k times)"
		"versions": versions
		"contextOrContextFunc": 1920,
		"iterations": 1000
	}

	versions = [
		{
			"name": "not"
			"func": function(context)
				value = false
				for _ = 0 to 1000
					value = (not value)
				end for
				return value
			end function
		}, {
			"name": "equals false"
			"func": function(context)
				value = false
				for _ = 0 to 1000
					value = (value = false)
				end for
				return value
			end function
		}
	]
	benchmarks["notVsEqualsFalse"] = {
		"name": "not vs equals false (1k times)"
		"versions": versions
		"contextOrContextFunc": Invalid,
		"iterations": 1000
	}

	return benchmarks
end function

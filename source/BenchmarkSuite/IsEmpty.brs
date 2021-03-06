function BenchmarkSuite_isEmptyBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "isEmpty()"
			"func": function(context)
				return context.isEmpty()
			end function
		}, {
			"name": "count() = 0"
			"func": function(context)
				return context.count() = 0
			end function
		}
	]
	benchmarks["array empty"] = {
		"name": "empty array"
		"versions": versions
		"contextOrContextFunc": []
		"iterations": 100000
	}

	benchmarks["arrayEmpty"] = {
		"name": "nonempty array"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildArrayContext
		"iterations": 100000
	}


	versions = [
		{
			"name": "isEmpty()"
			"func": function(context)
				return context.isEmpty()
			end function
		}, {
			"name": "count() = 0"
			"func": function(context)
				return context.count() = 0
			end function
		}
	]
	benchmarks["associativeArrayEmpty"] = {
		"name": "empty associativeArray"
		"versions": versions
		"contextOrContextFunc": {}
		"iterations": 100000
	}

	benchmarks["associativeArrayNonempty"] = {
		"name": "nonempty associativeArray"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildNestedAssocArrayContext
		"iterations": 100000
	}

	versions = [
		{
			"name": "len() = 0"
			"func": function(context)
				return context.len() = 0
			end function
		}, {
			"name": "= " + chr(34) + chr(34)
			"func": function(context)
				return context = ""
			end function
		}, {
			"name": "isEmpty()"
			"func": function(context)
				return context.isEmpty()
			end function
		}
	]
	benchmarks["stringEmpty"] = {
		"name": "empty string"
		"versions": versions
		"contextOrContextFunc": ""
		"iterations": 100000
	}

	benchmarks["stringNonempty"] = {
		"name": "nonempty string"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildStringContext
		"iterations": 100000
	}

	return benchmarks
end function

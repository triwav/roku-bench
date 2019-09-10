function BenchmarkSuite_isEmptyBenchmarks(config = {} as Object) as Object
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
		"name": "array empty "
		"versions": versions
		"contextOrContextFunc": []
		"iterations": 100000
	}

	benchmarks["arrayEmpty"] = {
		"name": "array nonempty"
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
		"name": "associativeArray empty"
		"versions": versions
		"contextOrContextFunc": {}
		"iterations": 100000
	}

	benchmarks["associativeArrayNonempty"] = {
		"name": "associativeArray nonempty"
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
		}
	]
	benchmarks["stringEmpty"] = {
		"name": "string empty"
		"versions": versions
		"contextOrContextFunc": ""
		"iterations": 100000
	}

	benchmarks["stringNonempty"] = {
		"name": "string nonempty"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildStringContext
		"iterations": 100000
	}

	return benchmarks
end function

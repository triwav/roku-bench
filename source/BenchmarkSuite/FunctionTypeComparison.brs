function BenchmarkSuite_functionTypeComparisonBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "direct function call"
			"func": function(context)
				return BenchmarkSuite_functionTypeComparisonBenchmarks_addTwoNumbers(context.a, context.b)
			end function
		}, {
			"name": "aa function"
			"func": function(context)
				return context.addTwoNumbers(context.a, context.b)
			end function
		}, {
			"name": "interface function"
			"func": function(context)
				return context.node.callFunc("addTwoNumbers", context.a, context.b)
			end function
		}
	]
	benchmarks["functionTypeComparison"] = {
		"name": "Test to compare the overhead of a direct function vs an aa function vs an interface function"
		"versions": versions
		"contextOrContextFunc": {
			"a": 33
			"b": 9,
			"addTwoNumbers": BenchmarkSuite_functionTypeComparisonBenchmarks_addTwoNumbers
			"node": createObject("roSgNode", "CallFuncNode")
		}
		"iterations": 5000,
		"config": {
			"typeChecking": "loose"
		}
	}

	return benchmarks
end function


function BenchmarkSuite_functionTypeComparisonBenchmarks_addTwoNumbers(a, b)
	return a + b
end function

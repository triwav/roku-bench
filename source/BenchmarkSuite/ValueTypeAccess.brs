function BenchmarkSuite_valueTypeAccessBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "dot"
			"func": function(context)
				total = context.levelOne.levelTwo.one
				total += context.levelOne.levelTwo.two.len()
				total += context.levelOne.levelTwo.three.count()
				return total
			end function
		}, {
			"name": "[]"
			"func": function(context)
				total = context["levelOne"]["levelTwo"]["one"]
				total += context["levelOne"]["levelTwo"]["two"].len()
				total += context["levelOne"]["levelTwo"]["three"].count()
				return total
			end function
		}
	]
	benchmarks["aaReadOptions"] = {
		"name": "AA read options"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildNestedAssocArrayContext,
		"iterations": 10000
	}


	versions = [
		{
			"name": "dot write access"
			"func": function(context)
				aa = {
					"levelOne": {
						"levelTwo": {

						}
					}
				}

				aa.levelOne.levelTwo.one = 1
				aa.levelOne.levelTwo.two = 2
				aa.levelOne.levelTwo.three = 3
				aa.levelOne.levelTwo.four = 4
				aa.levelOne.levelTwo.five = 5
				aa.levelOne.levelTwo.six = 6
			end function
		}, {
			"name": "[] write access"
			"func": function(context)
				aa = {
					"levelOne": {
						"levelTwo": {

						}
					}
				}

				aa["levelOne"]["levelTwo"]["one"] = 1
				aa["levelOne"]["levelTwo"]["two"] = 2
				aa["levelOne"]["levelTwo"]["three"] = 3
				aa["levelOne"]["levelTwo"]["four"] = 4
				aa["levelOne"]["levelTwo"]["five"] = 5
				aa["levelOne"]["levelTwo"]["six"] = 6
			end function
		}
	]
	benchmarks["aaWriteOptions"] = {
		"name": "AA write options"
		"versions": versions
		"contextOrContextFunc": Invalid,
		"iterations": 10000
	}


	versions = [
		{
			"name": "with quotes"
			"func": function(context)
				return {
					"levelOne": {
						"levelTwo": {
							"one": 1
							"two": 2
							"three": 3
						}
					}
				}
			end function
		}, {
			"name": "without quotes"
			"func": function(context)
				return {
					levelOne: {
						levelTwo: {
							one: 1
							two: 2
							three: 3
						}
					}
				}
			end function
		}
	]
	benchmarks["createAA"] = {
		"name": "Create AA"
		"versions": versions
		"contextOrContextFunc": Invalid,
		"iterations": 10000
	}


	contextFunc = function(config as Object) as Object
		versionName = config.version.name
		if versionName = "node" then
			return BenchmarkSuite_buildNestedNodeContext()
		else if versionName = "aa" then
			return BenchmarkSuite_buildNestedAssocArrayContext()
		end if
	end function

	versions = [
		{
			"name": "aa"
			"func": function(context)
				total = context.levelOne.levelTwo.one
				total += context.levelOne.levelTwo.two.len()
				total += context.levelOne.levelTwo.three.count()
				return total
			end function
		}, {
			"name": "node"
			"func": function(context)
				total = context.levelOne.levelTwo.one
				total += context.levelOne.levelTwo.two.len()
				total += context.levelOne.levelTwo.three.count()
				return total
			end function
		}
	]
	benchmarks["aaVsNodeRead"] = {
		"name": "AA vs Node Read Speed"
		"versions": versions
		"contextOrContextFunc": contextFunc,
		"iterations": 10000
	}

	' BENCHMARK IDEA: node write speed comparison


	contextFunc = function(config as Object) as Object
		versionName = config.version.name
		if versionName = "array" then
			return [
				0
				1
				2
				3
			]
		else if versionName = "aa" then
			return {
				"zero": 0
				"one": 1
				"two": 2
				"three": 3
			}
		end if
	end function

	versions = [
		{
			"name": "array"
			"func": function(context)
				total = context[0]
				total += context[1]
				total += context[2]
				total += context[3]
				return total

			end function
		}, {
			"name": "aa"
			"func": function(context)
				total = context.zero
				total += context.one
				total += context.two
				total += context.three
				return total
			end function
		}
	]
	benchmarks["aaVsArrayRead"] = {
		"name": "AA vs Array Read"
		"versions": versions
		"contextOrContextFunc": contextFunc,
		"iterations": 25000
	}
	return benchmarks
end function

function BenchmarkSuite_componentInheritanceBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "manually on existing"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingOneLevel")
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}, {
			"name": "setFields on existing"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingOneLevel")
				node.setFields({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "string"
					"d": 2
				})
			end function
		}, {
			"name": "addFields"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				node.addFields({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "string"
					"d": 2
				})
			end function
		}, {
			"name": "update"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				node.update({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "string"
					"d": 2
				}, true)
			end function
		}
	]
	benchmarks["settingNodeValues"] = {
		"name": "Comparison of methods for setting node values"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 1000
	}

	versions = [
		{
			"name": "no inheritance addField"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				node.addField("a", "node", false)
				node.addField("b", "bool", false)
				node.addField("c", "string", false)
				node.addField("d", "integer", false)
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}, {
			"name": "no inheritance addFields"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				node.addFields({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "string"
					"d": 2
				})
			end function
		}, {
			"name": "one level"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingOneLevel")
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}, {
			"name": "two levels"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingTwoLevels")
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}, {
			"name": "three levels"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingThreeLevels")
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}, {
			"name": "four levels"
			"func": function(context)
				node = createObject("roSGNode", "ComponentInheritanceBenchmarkingFourLevels")
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "string"
				node.d = 2
			end function
		}
	]
	benchmarks["componentInheritancePenalty"] = {
		"name": "Test to see if component inheritance hurts performance"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 500
	}

	return benchmarks
end function

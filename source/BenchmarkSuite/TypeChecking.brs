function BenchmarkSuite_typeCheckingBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "type(n)"
			"func": function(context)
				valueType = type(context)
				return (valueType = "String") or (valueType = "roString")
			end function
		}, {
			"name": "type(n, 3)"
			"func": function(context)
				valueType = type(context, 3)
				return (valueType = "String") or (valueType = "roString")
			end function
		}, {
			"name": "getInterface() with Invalid check"
			"func": function(context)
				if context = Invalid return false
				return getInterface(context, "ifString") <> Invalid
			end function
		}, {
			"name": "getInterface() without Invalid check"
			"func": function(context)
				return getInterface(context, "ifString") <> Invalid
			end function
		}
	]
	benchmarks["string"] = {
		"name": "String type checking"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildStringContext,
		"iterations": 10000
	}


	versions = [
		{
			"name": "type(n)"
			"func": function(context)
				return type(context) = "roSGNode"
			end function
		}, {
			"name": "type(n, 3)"
			"func": function(context)
				return type(context, 3) = "roSGNode"
			end function
		}, {
			"name": "getInterface() with Invalid check"
			"func": function(context)
				if context = Invalid return false
				return getInterface(context, "ifSGNodeChildren") <> Invalid
			end function
		}, {
			"name": "getInterface() without Invalid check"
			"func": function(context)
				return getInterface(context, "ifSGNodeChildren") <> Invalid
			end function
		}
	]
	benchmarks["node"] = {
		"name": "Node type checking"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildNestedNodeContext,
		"iterations": 10000
	}

	versions = [
		{
			"name": "type(n)"
			"func": function(context)
				return type(context) = "roAssociativeArray"
			end function
		}, {
			"name": "type(n, 3)"
			"func": function(context)
				return type(context, 3) = "roAssociativeArray"
			end function
		}, {
			"name": "getInterface() with Invalid check"
			"func": function(context)
				if context = Invalid return false
				return getInterface(context, "ifAssociativeArray") <> Invalid
			end function
		}, {
			"name": "getInterface() without Invalid check"
			"func": function(context)
				return getInterface(context, "ifAssociativeArray") <> Invalid
			end function
		}
	]
	benchmarks["aa"] = {
		"name": "AssociativeArray type checking"
		"versions": versions
		"contextOrContextFunc": BenchmarkSuite_buildNestedAssocArrayContext,
		"iterations": 10000
	}


	context = []
	for i = 0 to 1000
		context.push(i)
	end for

	versions = [
		{
			"name": "type(n)"
			"func": function(context)
				return type(context) = "roArray"
			end function
		}, {
			"name": "type(n, 3)"
			"func": function(context)
				return type(context, 3) = "roArray"
			end function
		}, {
			"name": "getInterface() with Invalid check"
			"func": function(context)
				if context = Invalid return false
				return getInterface(context, "ifArray") <> Invalid
			end function
		}, {
			"name": "getInterface() without Invalid check"
			"func": function(context)
				return getInterface(context, "ifArray") <> Invalid
			end function
		}
	]
	benchmarks["array"] = {
		"name": "Array type checking"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
	}


	context = 3

	versions = [
		{
			"name": "type(n)"
			"func": function(context)
				valueType = type(context)
				return (valueType = "Integer") or (valueType = "roInt") or (valueType = "roInteger")
			end function
		}, {
			"name": "type(n, 3)"
			"func": function(context)
				valueType = type(context, 3)
				return (valueType = "Integer") or (valueType = "roInt") or (valueType = "roInteger")
			end function
		}, {
			"name": "getInterface() with Invalid check"
			"func": function(context)
				if context = Invalid return false
				return getInterface(context, "ifInt") <> Invalid
			end function
		}, {
			"name": "getInterface() without Invalid check"
			"func": function(context)
				return getInterface(context, "ifInt") <> Invalid
			end function
		}
	]
	benchmarks["integer"] = {
		"name": "Integer type checking"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
	}


	versions = [
		{
			"name": "isAA"
			"func": function(context)
				return type(context) = "roAssociativeArray"
			end function
		}, {
			"name": "isInteger"
			"func": function(context)
				valueType = type(context)
				return (valueType = "Integer") or (valueType = "roInt") or (valueType = "roInteger")
			end function
		}, {
			"name": "isString"
			"func": function(context)
				valueType = type(context)
				return (valueType = "String") or (valueType = "roString")
			end function
		}, {
			"name": "context <> Invalid"
			"func": function(context)
				return context <> Invalid
			end function
		}
	]
	benchmarks["explicitCheckingVsNotInvalidSpeed"] = {
		"name": "explicit checking vs not Invalid speed"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 10000
	}

	versions = [
		{
			"name": "context.doesExist(key)"
			"func": function(context)
				return context.doesExist("key")
			end function
		}, {
			"name": "context.key <> Invalid"
			"func": function(context)
				return context.key <> Invalid
			end function
		}
	]
	benchmarks["doesExistVsInvalidMiss"] = {
		"name": "ifAssociativeArray.doesExist vs Invalid (Miss)"
		"versions": versions
		"contextOrContextFunc": {}
		"iterations": 10000
	}

	benchmarks["doesExistVsInvalidHit"] = {
		"name": "ifAssociativeArray.doesExist vs Invalid (Hit)"
		"versions": versions
		"contextOrContextFunc": {"key": BenchmarkSuite_buildStringContext()}
		"iterations": 10000
	}

	return benchmarks
end function

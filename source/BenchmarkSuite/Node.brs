function BenchmarkSuite_nodeBenchmarks(config = {} as Object) as Object
	benchmarks = {}

	context = createObject("roSGNode", "Node")
	versions = [
		{
			"name": "clone(false)"
			"func": function(context)
				return context.clone(false)
			end function
		}, {
			"name": "clone(true)"
			"func": function(context)
				return context.clone(true)
			end function
		}, {
			"name": "create"
			"func": function(context)
				return createObject("roSGNode", "Node")
			end function
		}
	]
	benchmarks["createVsCloneNoData"] = {
		"name": "create node vs clone no data"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
	}


	context = createObject("roSGNode", "Node")
	context.update({
		"one": 1
		"two": BenchmarkSuite_buildStringContext()
		"three": [
			0
			1
			2
			3
		]
	})
	versions = [
		{
			"name": "clone"
			"func": function(context)
				return context.clone(false)
			end function
		}, {
			"name": "create"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				node.addFields({
					"one": context.one
					"two": context.two
					"three": context.three
				})
				return node
			end function
		}
	]
	benchmarks["createVsCloneWithData"] = {
		"name": "create node vs clone with data"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
	}

	versions = [
		{
			"name": "Node"
			"func": function(context)
				return createObject("roSGNode", "Node")
			end function
		}, {
			"name": "ContentNode"
			"func": function(context)
				return createObject("roSGNode", "ContentNode")
			end function
		}
	]
	benchmarks["nodeVsContentNodeCreationSpeed"] = {
		"name": "Node vs ContentNode creation speed"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
	}


	contextFunc = function(config = Invalid as Object)
		context = createObject("roSGNode", "Node")
		for i = 0 to 50
			child = context.createChild("Node")
			child.id = i
		end for
		return context
	end function

	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				value = 0
				for each node in context.getChildren(-1, 0)
					value++
				end for
				return value
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				value = 0
				for i = 0 to context.getChildCount() - 1
					value++
				end for
				return value
			end function
		}
	]
	benchmarks["nodeChildIteration"] = {
		"name": "Node Child Iterate"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
	}


	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				for each node in context.getChildren(-1, 0)
					if node.id = "0" then return node
				end for
				return invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "0" then return node
				end for
				return invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildFirstItem"] = {
		"name": "Node Child Iterate With getChild (First Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
	}


	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				for each node in context.getChildren(-1, 0)
					if node.id = "25" then return node
				end for
				return invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "25" then return node
				end for
				return invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildMiddleItem"] = {
		"name": "Node Child Iterate With getChild (Middle Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
	}


	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				for each node in context.getChildren(-1, 0)
					if node.id = "49" then return node
				end for
				return invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "49" then return node
				end for
				return invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildLastItem"] = {
		"name": "Node Child Iterate With getChild (Last Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
	}

	return benchmarks
end function

function BenchmarkSuite_nodeBenchmarks() as Object
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
		"name": "Create node vs clone no data"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
		"config": {
			"typeChecking": "off"
		}
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
	}, true)
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
		"name": "Create node vs clone with data"
		"versions": versions
		"contextOrContextFunc": context
		"iterations": 10000
		"config": {
			"typeChecking": "off"
		}
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
		"config": {
			"typeChecking": "off"
		}
	}


	contextFunc = function(config = {} as Object)
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
				return Invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "0" then return node
				end for
				return Invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildFirstItem"] = {
		"name": "Node Child Iterate With getChild (First Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
		"config": {
			"typeChecking": "off"
		}
	}


	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				for each node in context.getChildren(-1, 0)
					if node.id = "25" then return node
				end for
				return Invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "25" then return node
				end for
				return Invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildMiddleItem"] = {
		"name": "Node Child Iterate With getChild (Middle Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
		"config": {
			"typeChecking": "off"
		}
	}


	versions = [
		{
			"name": "for each node in context.getChildren(-1, 0)"
			"func": function(context)
				for each node in context.getChildren(-1, 0)
					if node.id = "49" then return node
				end for
				return Invalid
			end function
		}, {
			"name": "for i = 0 to context.getChildCount() - 1"
			"func": function(context)
				for i = 0 to context.getChildCount() - 1
					node = context.getChild(i)
					if node.id = "49" then return node
				end for
				return Invalid
			end function
		}
	]
	benchmarks["nodeChildIterationWithGetChildLastItem"] = {
		"name": "Node Child Iterate With getChild (Last Item)"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 1000
		"config": {
			"typeChecking": "off"
		}
	}

	contextFunc = function(config = {} as Object)
		return createObject("roSGNode", "Node")
	end function

	versions = [
		{
			"name": "createChild"
			"func": function(context)
				context.createChild("Node")
			end function
		}, {
			"name": "createObject + appendChild one line"
			"func": function(context)
				context.appendChild(createObject("roSGNode", "Node"))
			end function
		}, {
			"name": "createObject + appendChild separate lines"
			"func": function(context)
				node = createObject("roSGNode", "Node")
				context.appendChild(node)
			end function
		}
	]
	benchmarks["createChildOptions"] = {
		"name": "Create child options"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 2000
		"config": {
			"typeChecking": "off"
		}
	}

	contextFunc = function(config = {} as Object)
		nodes = []
		for i = 0 to config.iterations
			nodes.push(createObject("roSGNode", "ComponentInheritanceBenchmarkingOneLevel"))
		end for
		return nodes
	end function

	versions = [
		{
			"name": "setFields"
			"func": function(context, i)
				node = context[i]
				node.setFields({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "c"
					"d": 1
				})
			end function
		}, {
			"name": "manual"
			"func": function(context, i)
				node = context[i]
				node.a = createObject("roSGNode", "Node")
				node.b = true
				node.c = "c"
				node.d = 1
			end function
		}, {
			"name": "update with addFields"
			"func": function(context, i)
				node = context[i]
				node.update({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "c"
					"d": 1
				}, true)
			end function
		}, {
			"name": "update without addFields"
			"func": function(context, i)
				node = context[i]
				node.update({
					"a": createObject("roSGNode", "Node")
					"b": true
					"c": "c"
					"d": 1
				})
			end function
		}
	]
	benchmarks["settingExistingFields4Values"] = {
		"name": "Setting existing fields options comparison 4 values"
		"versions": versions
		"contextOrContextFunc": contextFunc
		"iterations": 2000
		"config": {
			"includeIterationCount": true
		}
	}

	return benchmarks
end function

sub init()
	versions = [
		{
			"name": "Predefined ContentNode field"
			"func": function(context)
				context.node.TITLE = context.string
			end function
		}, {
			"name": "Added field on ContentNode"
			"func": function(context)
				context.node.customField = context.string
			end function
		}
	]
	node = CreateObject("roSGNode", "ContentNode")
	node.addField("customField", "string", false)
	context = {
		string: BenchmarkSuite_buildStringContext()
		node: node
	}

	runComparisonBenchmark("Predefined ContentNode field vs added field - string", versions, context, 5000)
	benchmarksComplete()
end sub

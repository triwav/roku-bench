sub init()
return
	runNodeThresholdBenchmark()
	runThreadThresholdBenchmark()
end sub

sub runNodeThresholdBenchmark()
	iterations = 2000

	contextFunc = function(config as Object) as Object
		nodes = []
		for i = 0 to config.iterations
			node = createObject("roSGNode", "BenchmarkNodeVsAssocArrayThresholdObserverNode")
			nodes.push(node)
		end for
		return nodes
	end function

	versions = [
		{
			"name": "aa"
			"func": function(context, i)
				context[i].aaObserver = {
					"body": BenchmarkSuite_buildStringContext()
				}
			end function
		}, {
			"name": "node"
			"func": function(context, i)
				nodeValue = createObject("roSGNode", "Node")
				nodeValue.update({
					"body": BenchmarkSuite_buildStringContext()
				}, true)
				context[i].nodeObserver = nodeValue
			end function
		}
	]
	return
	runComparisonBenchmark("Node Vs AssocArray Node Threshold", versions, contextFunc, iterations, {
		"includeIterationCount": true
	})
end sub

sub runThreadThresholdBenchmark()
	iterations = 2000

	m.task = createObject("roSGNode", "BenchmarkNodeVsAssocArrayThresholdTask")
	m.task.observeFieldScoped("state", "onTaskStateChange")
	m.task.control = "RUN"

	aaObserverNodes = []
	for i = 0 to iterations
		node = createObject("roSGNode", "BenchmarkNodeVsAssocArrayThresholdObserverNode")
		aaObserverNodes.push(node)
	end for

	nodeObserverNodes = []
	for i = 0 to iterations
		node = createObject("roSGNode", "BenchmarkNodeVsAssocArrayThresholdObserverNode")
		nodeObserverNodes.push(node)
	end for

	m.task.command = {
		"type": "renderThreadCallbacks"
		"context": {
			"iterations": iterations
			"aaObserverNodes": aaObserverNodes
			"nodeObserverNodes": nodeObserverNodes
		}
	}
end sub

sub onTaskStateChange(event as Object)
	state = event.getData()
	if state = "stop" then
		benchmarksComplete()
	end if
end sub

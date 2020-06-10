sub init()
	m.top.functionName = "taskThread"
	m.port = createObject("roMessagePort")
	m.top.observeFieldScoped("command", m.port)
end sub

sub taskThread()
	message = wait(0, m.port)
	if message <> Invalid then
		field = message.getField()

		if field = "command" then
			command = message.getData()
			if command.type = "renderThreadCallbacks" then
				runThreadThresholdBenchmark(command.context)
				return
			end if
		end if
	end if
end sub

sub runThreadThresholdBenchmark(context as Object)
	versions = [
		{
			"name": "aa"
			"func": function(context, i)
				callbackNode = context.aaObserverNodes[i]
				output = {
					"body": BenchmarkSuite_buildStringContext()
				}
				callbackNode.aaObserver = output
			end function
		}, {
			"name": "node"
			"func": function(context, i)
				callbackNode = context.nodeObserverNodes[i]
				output = createObject("roSGNode", "Node")
				output.update({
					"body": BenchmarkSuite_buildStringContext()
				}, true)
				callbackNode.nodeObserver = output
			end function
		}
	]
	return
	runComparisonBenchmark("Node Vs AssocArray Thread Threshold", versions, context, context.iterations, {
		"includeIterationCount": true
		"runs": 1
	})
end sub

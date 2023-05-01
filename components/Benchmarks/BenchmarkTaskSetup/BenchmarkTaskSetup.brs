sub init()
	versions = [
		{
			"name": "Pulling global value in init"
			"func": function(context)
				task = createObject("roSGNode", "InitSetupTask")
				port = createObject("roMessagePort")
				task.observeFieldScoped("result", port)
				task.control = "RUN"
				result = wait(0, port)
				stop
				return result
			end function
		}
	]
	runComparisonBenchmark("get node size options", versions, invalid, 5000, {"operationMultiplier": 3})

	benchmarksComplete()
end sub

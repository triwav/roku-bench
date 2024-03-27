sub main()
	port = createObject("roMessagePort")
	screen = createObject("roSGScreen")
	screen.setMessagePort(port)
	scene = screen.createScene("MainScene")
	screen.show()
	m.global = screen.getGlobalNode()
	m.global.observeField("exitApplication", port)

	config = {
		"iterationMultiplier": 1
		"runs": 3
	}

	' Short circuit for writing or testing specific benchmark
	' BenchmarkSuite_runSectionBenchmarks(BenchmarkSuite_runComponentCreationSpeedBenchmarks(), config, [])
	' return

	' Example custom config
	benchmarkingConfig = {
		"config": {
			"iterationMultiplier": 1
			"runs": 3
		}
		"sections": {
			' "typeChecking": {
			' 	"config": {}
			' 	"benchmarksToRun": {
					' "node": {}
					' "array": {}
					' "string": {}
			' 	}
			' }
			' "functionTypeComparison": {}
			' "isEmpty": {}
			"string": {}
		}
		"nodeBenchmarks": {
			' "BenchmarkPredefinedContentNodeFieldVsNot": {}
			' "BenchmarkTaskSetup": {}
		}
	}

	' BenchmarkSuite_benchmarkAllMainThread(config)

	' benchmarkingConfig = BenchmarkSuite_buildRenderThreadBenchmarkAllConfig(config)
	m.global.benchmarkingConfig = benchmarkingConfig

	while true
		message = port.getMessage()

        if type(message) = "roSGNodeEvent" and message.getField() = "exitApplication" then
			return
		end if
	end while
end sub

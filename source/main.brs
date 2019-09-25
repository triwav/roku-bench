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
		"runs": 1
	}

	' Example custom config
	' benchmarkingConfig = {
	' 	"config": {
	' 		"iterationMultiplier": 1
	' 		"runs": 3
	' 	}
	' 	"sections": {
	' 		"typeChecking": {
	' 			"config": {}
	' 			"benchmarksToRun": {
	' 				"node": {}
	' 				"array": {}
	' 				"string": {}
	' 			}
	' 		}
	' 	}
	' 	"nodeBenchmarks": {
	' 		"BenchmarkCallFuncVsAlternatives": {}
	' 	}
	' }

	BenchmarkSuite_benchmarkAllMainThread(config)

	benchmarkingConfig = BenchmarkSuite_buildRenderThreadBenchmarkAllConfig(benchmarkingConfig)
	m.global.benchmarkingConfig = benchmarkingConfig

	while true
		msg = port.getMessage()

        if type(msg) = "roSGNodeEvent" and msg.getField() = "exitApplication" then
			return
		end if
	end while
end sub

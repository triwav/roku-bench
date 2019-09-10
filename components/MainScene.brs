sub init()
	m.benchmarkFunctions = BenchmarkSuite_getBenchmarkFunctionsMap()

	m.global.addFields({
		"benchmarkingConfig": {}
		"exitApplication": false
	})
	m.global.observeFieldScoped("benchmarkingConfig", "onBenchmarkingConfigChanged")

	m.timer = m.top.findNode("timer")
	m.timer.observeFieldScoped("fire", "onTimerFired")
	m.benchmarkingConfig = {}
end sub

sub onBenchmarkingConfigChanged(msg as Object)
	m.benchmarkingConfig = msg.getData()
	m.timer.control = "start"
end sub

sub onTimerFired()
	benchmarkConfig = {}
	globalConfig = m.benchmarkingConfig.config
	if globalConfig <> Invalid then benchmarkConfig.append(globalConfig)
	sections = m.benchmarkingConfig.sections
	nodeBenchmarks = m.benchmarkingConfig.nodeBenchmarks
	if sections <> Invalid and sections.count() > 0 then
		sectionKey = sections.keys()[0]
		section = sections[sectionKey]

		sectionConfig = section.config
		if sectionConfig <> Invalid then benchmarkConfig.append(sectionConfig)

		sectionBenchmarks = m.benchmarkFunctions[sectionKey]()

		benchmarksToRun = section.benchmarksToRun
		if type(benchmarksToRun) <> "roAssociativeArray" or benchmarksToRun.count() = 0 then
			benchmarksToRun = {}
			for each key in sectionBenchmarks
				benchmarksToRun[key] = {}
			end for
			section.benchmarksToRun = benchmarksToRun
		end if

		benchmarkKey = benchmarksToRun.keys()[0]

		benchmarkConfig.append(benchmarksToRun[benchmarkKey])

		benchmark = sectionBenchmarks[benchmarkKey]
		runComparisonBenchmark(benchmark.name, benchmark.versions, benchmark.contextOrContextFunc, benchmark.iterations, benchmarkConfig)
		benchmarksToRun.delete(benchmarkKey)
		if benchmarksToRun.count() = 0 then
			sections.delete(sectionKey)
		end if
	else if type(nodeBenchmarks) = "roAssociativeArray" and nodeBenchmarks.count() > 0 then
		nodeType = nodeBenchmarks.keys()[0]
		createObject("roSGNode", nodeType)
		nodeBenchmarks.delete(nodeType)
	else
		m.global.exitApplication = true
		return
	end if

	m.timer.control = "start"
end sub

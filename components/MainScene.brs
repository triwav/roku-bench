sub init()
	m.benchmarkFunctions = BenchmarkSuite_getBenchmarkFunctionsMap()

	m.global.addFields({
		"benchmarkingConfig": {}
		"exitApplication": false
		"boolean": true
		"string": "HD"
		"integer": 1
		"float": 1.0
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
	if sections <> Invalid AND sections.count() > 0 then
		sectionKey = sections.keys()[0]
		section = sections[sectionKey]

		sectionConfig = section.config
		if sectionConfig <> Invalid then benchmarkConfig.append(sectionConfig)

		sectionBenchmarks = m.benchmarkFunctions[sectionKey]()

		benchmarksToRun = section.benchmarksToRun
		if type(benchmarksToRun) <> "roAssociativeArray" OR benchmarksToRun.isEmpty() then
			benchmarksToRun = {}
			for each key in sectionBenchmarks
				benchmarksToRun[key] = {}
			end for
			section.benchmarksToRun = benchmarksToRun
		end if

		benchmarkKey = benchmarksToRun.keys()[0]

		benchmarkConfig.append(benchmarksToRun[benchmarkKey])

		BenchmarkSuite_runBenchmark(sectionBenchmarks, benchmarkKey, benchmarkConfig)
		benchmarksToRun.delete(benchmarkKey)
		if benchmarksToRun.isEmpty() then
			sections.delete(sectionKey)
		end if
		m.timer.control = "start"
	else if type(nodeBenchmarks) = "roAssociativeArray" AND nodeBenchmarks.count() > 0 then
		nodeType = nodeBenchmarks.keys()[0]
		m.benchmarkNode = createObject("roSGNode", nodeType)
		nodeBenchmarks.delete(nodeType)
		if m.benchmarkNode.complete then
			onBenchmarkNodeCompleteChange()
		else
			m.benchmarkNode.observeFieldScoped("complete", "onBenchmarkNodeCompleteChange")
		end if
	else
		m.global.exitApplication = true
		return
	end if
end sub

sub onBenchmarkNodeCompleteChange()
	m.timer.control = "start"
end sub

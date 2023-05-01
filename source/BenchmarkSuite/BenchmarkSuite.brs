function BenchmarkSuite_getBenchmarkFunctionsMap() as Object
	return {
		"associativeArray": BenchmarkSuite_associativeArrayBenchmarks
		"asType": BenchmarkSuite_asTypeBenchmarks
		"componentCreationSpeed": BenchmarkSuite_runComponentCreationSpeedBenchmarks
		"componentInheritance": BenchmarkSuite_componentInheritanceBenchmarks
		"isEmpty": BenchmarkSuite_isEmptyBenchmarks
		"isNotEmpty": BenchmarkSuite_isNotEmptyBenchmarks
		"iteration": BenchmarkSuite_iterationBenchmarks
		"nestedFunctions": BenchmarkSuite_nestedFunctionBenchmarks
		"functionTypeComparison": BenchmarkSuite_functionTypeComparisonBenchmarks
		"node": BenchmarkSuite_nodeBenchmarks
		"operators": BenchmarkSuite_operatorBenchmarks
		"rokuInterfaces": BenchmarkSuite_rokuInterfacesBenchmarks
		"string": BenchmarkSuite_stringBenchmarks
		"typeChecking": BenchmarkSuite_typeCheckingBenchmarks
		"typeConversion": BenchmarkSuite_typeConversionBenchmarks
		"valueTypeAccess": BenchmarkSuite_valueTypeAccessBenchmarks
	}
end function

function BenchmarkSuite_buildStringContext(config = {} as Object) as String
	return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id quam et nisl sodales porta a sed massa. Sed pharetra, felis eu suscipit bibendum, justo justo egestas metus, sit amet pulvinar metus lorem nec tortor. Aenean aliquet sodales massa. Aliquam a elementum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar pellentesque purus, at ullamcorper orci sodales consectetur. Phasellus euismod dolor interdum dolor condimentum condimentum. Donec sem odio, pellentesque sodales diam sit amet, fringilla lacinia nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque rhoncus, tortor eget rhoncus posuere, tellus diam sollicitudin ex, ut rutrum nibh nisi a ante. Fusce convallis nisl at nunc ultricies accumsan. Aliquam vel dui tellus. Quisque pretium eros vel euismod euismod. Pellentesque nec quam lacus. Donec tincidunt quam sed quam molestie mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
end function

function BenchmarkSuite_buildArrayContext(config = {} as Object) as Object
	context = []
	for i = 0 to 500
		context.push(i.toStr())
	end for
	return context
end function

function BenchmarkSuite_buildNestedAssocArrayContext(config = {} as Object) as Object
	return {
		"subtype": "Node"
		"levelOne": {
			"subtype": "Node"
			"levelTwo": {
				"subtype": "Node"
				"one": 1
				"two": BenchmarkSuite_buildStringContext()
				"three": [
					0
					1
					2
					3
				]
			}
		}
	}
end function

function BenchmarkSuite_buildNestedNodeContext(config = {} as Object) as Object
	node = createObject("roSGNode", "Node")
	node.update(BenchmarkSuite_buildNestedAssocArrayContext(), true)
	return node
end function

function BenchmarkSuite_buildRenderThreadBenchmarkAllConfig(globalConfig = {} as Object) as Object
	globalConfig.benchmarkNamePrefix = "RENDER THREAD"
	config = {
		"config": globalConfig
		"nodeBenchmarks": {
			"BenchmarkCallFuncVsAlternatives": {}
			"BenchmarkNodeRef": {}
			"BenchmarkNodeVsAssocArrayThreshold": {}
			BenchmarkPredefinedContentNodeFieldVsNot : {}
		}
		"sections": {}
	}
	functions = BenchmarkSuite_getBenchmarkFunctionsMap()
	for each key in functions
		config.sections[key] = {}
	end for
	return config
end function

sub BenchmarkSuite_benchmarkAllMainThread(globalConfig = {} as Object)
	globalConfig.benchmarkNamePrefix = "MAIN THREAD"
	benchmarkFunctions = BenchmarkSuite_getBenchmarkFunctionsMap()

	sectionBenchmarkFunctions = BenchmarkSuite_getBenchmarkFunctionsMap()
	for each key in sectionBenchmarkFunctions
		BenchmarkSuite_runSectionBenchmarks(sectionBenchmarkFunctions[key](), globalConfig)
		print
	end for
end sub

sub BenchmarkSuite_runSectionBenchmarks(sectionsBenchmarks as Object, config = {} as Object, benchmarkKeys = [] as Object)
	if benchmarkKeys.isEmpty() then
		benchmarkKeys = sectionsBenchmarks.keys()
	end if

	for each key in benchmarkKeys
		BenchmarkSuite_runBenchmark(sectionsBenchmarks, key, config)
	end for
end sub

sub BenchmarkSuite_runBenchmark(benchmarks as Object, key as String, config = {} as Object)
	benchmarkConfig = {}
	benchmarkConfig.append(config)
	benchmark = benchmarks[key]
	benchmarkName = benchmark.name
	if benchmarkName = Invalid then benchmarkName = key
	if benchmark.config <> Invalid then benchmarkConfig.append(benchmark.config)

	versions = benchmark.versions
	if versions <> Invalid then
		runComparisonBenchmark(benchmarkName, versions, benchmark.contextOrContextFunc, benchmark.iterations, benchmarkConfig)
	else if benchmark.func <> Invalid then
		runSpeedBenchmark(benchmarkName, benchmark.func, benchmark.contextOrContextFunc, benchmark.iterations, benchmarkConfig)
	end if
end sub

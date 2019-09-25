function BenchmarkSuite_getBenchmarkFunctionsMap() as Object
	return {
		"associativeArray": BenchmarkSuite_associativeArrayBenchmarks
		"asType": BenchmarkSuite_asTypeBenchmarks
		"componentInheritance": BenchmarkSuite_componentInheritanceBenchmarks
		"iteration": BenchmarkSuite_iterationBenchmarks
		"isEmpty": BenchmarkSuite_isEmptyBenchmarks
		"nestedFunctions": BenchmarkSuite_nestedFunctionBenchmarks
		"operators": BenchmarkSuite_operatorBenchmarks
		"typeChecking": BenchmarkSuite_typeCheckingBenchmarks
		"valueTypeAccess": BenchmarkSuite_valueTypeAccessBenchmarks
	}
end function

function BenchmarkSuite_buildStringContext(config = Invalid as Object) as String
	return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id quam et nisl sodales porta a sed massa. Sed pharetra, felis eu suscipit bibendum, justo justo egestas metus, sit amet pulvinar metus lorem nec tortor. Aenean aliquet sodales massa. Aliquam a elementum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar pellentesque purus, at ullamcorper orci sodales consectetur. Phasellus euismod dolor interdum dolor condimentum condimentum. Donec sem odio, pellentesque sodales diam sit amet, fringilla lacinia nibh. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque rhoncus, tortor eget rhoncus posuere, tellus diam sollicitudin ex, ut rutrum nibh nisi a ante. Fusce convallis nisl at nunc ultricies accumsan. Aliquam vel dui tellus. Quisque pretium eros vel euismod euismod. Pellentesque nec quam lacus. Donec tincidunt quam sed quam molestie mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."
end function

function BenchmarkSuite_buildArrayContext(config = Invalid as Object) as Object
	context = []
	for i = 0 to 500
		context.push(i.toStr())
	end for
	return context
end function

function BenchmarkSuite_buildNestedAssocArrayContext(config = Invalid as Object) as Object
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

function BenchmarkSuite_buildNestedNodeContext(config = Invalid as Object) as Object
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

	BenchmarkSuite_runComponentCreationSpeedBenchmarks(globalConfig)
end sub

sub BenchmarkSuite_runSectionBenchmarks(sectionsBenchmarks as Object, config = {} as Object, benchmarkKey = "" as String)
	if benchmarkKey.len() > 0 then
		benchmark = sectionsBenchmarks[benchmarkKey]
		runComparisonBenchmark(benchmark.name, benchmark.versions, benchmark.contextOrContextFunc, benchmark.iterations, config)
	else
		for each key in sectionsBenchmarks
			benchmark = sectionsBenchmarks[key]
			runComparisonBenchmark(benchmark.name, benchmark.versions, benchmark.contextOrContextFunc, benchmark.iterations, config)
		end for
	end if
end sub

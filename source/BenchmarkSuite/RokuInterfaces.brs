function BenchmarkSuite_rokuInterfacesBenchmarks() as object
	benchmarks = {}
	versions = [{
		"name": "getGlobalAA().global.string"
		"func": function(context)
			return getGlobalAA().global.String
		end function
	}, {
		"name": "createObject(roDeviceInfo).getUIResolution().name"
		"func": function(context)
			return createObject("roDeviceInfo").getUIResolution().name
		end function
	}]
	benchmarks["globalReferenceVsGetUIResolution"] = {
		"name": "Global Reference vs getUIResolution for determining resolution"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}

	return benchmarks
end function

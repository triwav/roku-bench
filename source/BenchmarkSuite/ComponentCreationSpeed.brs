

function BenchmarkSuite_runComponentCreationSpeedBenchmarks() as Object
	benchmarks = {}

	benchmarks["roUrlTransfer"] = {
		"func": function(context)
			createObject("roUrlTransfer")
		end function
		"iterations": 1000
		"config": {
			"thread": "main"
		}
	}


	benchmarks["roByteArray"] = {
		"func": function(context)
			createObject("roByteArray")
		end function
		"iterations": 1000
	}


	benchmarks["roAssociativeArray"] = {
		"func": function(context)
			createObject("roAssociativeArray")
		end function
		"iterations": 1000
	}


	benchmarks["roChannelStore"] = {
		"func": function(context)
			createObject("roChannelStore")
		end function
		"iterations": 1000
		"config": {
			"thread": "main"
		}
	}


	benchmarks["roDateTime"] = {
		"func": function(context)
			createObject("roDateTime")
		end function
		"iterations": 1000
	}


	benchmarks["roDeviceInfo"] = {
		"func": function(context)
			createObject("roDeviceInfo")
		end function
		"iterations": 1000
	}


	benchmarks["roEVPCipher"] = {
		"func": function(context)
			createObject("roEVPCipher")
		end function
		"iterations": 1000
	}


	benchmarks["roEVPCipher"] = {
		"func": function(context)
			createObject("roEVPCipher")
		end function
		"iterations": 1000
	}


	benchmarks["roEVPDigest"] = {
		"func": function(context)
			createObject("roEVPDigest")
		end function
		"iterations": 1000
	}


	benchmarks["roFileSystem"] = {
		"func": function(context)
			createObject("roFileSystem")
		end function
		"iterations": 1000
		"config": {
			"thread": "main"
		}
	}


	benchmarks["roHdmiStatus"] = {
		"func": function(context)
			createObject("roHdmiStatus")
		end function
		"iterations": 1000
	}


	benchmarks["roHMAC"] = {
		"func": function(context)
			createObject("roHMAC")
		end function
		"iterations": 1000
	}


	benchmarks["roHttpAgent"] = {
		"func": function(context)
			createObject("roHttpAgent")
		end function
		"iterations": 1000
	}


	benchmarks["roInput"] = {
		"func": function(context)
			createObject("roInput")
		end function
		"iterations": 1000
	}


	benchmarks["roLocalization"] = {
		"func": function(context)
			createObject("roLocalization")
		end function
		"iterations": 1000
	}


	benchmarks["roMessagePort"] = {
		"func": function(context)
			createObject("roMessagePort")
		end function
		"iterations": 1000
	}


	benchmarks["roMicrophone"] = {
		"func": function(context)
			createObject("roMicrophone")
		end function
		"iterations": 1000
	}


	benchmarks["roRegistrySection"] = {
		func: function(context)
			createObject("roRegistrySection", "main")
		end function
		"iterations": 1000
	}


	benchmarks["roRegistry"] = {
		func: function(context)
			createObject("roRegistry")
		end function
		"iterations": 1000
	}


	benchmarks["roRSA"] = {
		func: function(context)
			createObject("roRSA")
		end function
		"iterations": 1000
		"config": {
			"thread": "main"
		}
	}

	benchmarks["roRegex"] = {
		func: function(context)
			createObject("roRegex", "\[([0-9]+)\]", "i")
		end function
		"iterations": 1000
	}

	benchmarks["roTimespan"] = {
		func: function(context)
			createObject("roTimespan")
		end function
		"iterations": 1000
	}

	benchmarks["getGlobalAA"] = {
		func: function(context)
			getGlobalAA()
		end function
		"iterations": 100000
	}
	return benchmarks
end function

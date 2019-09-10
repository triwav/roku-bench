

sub BenchmarkSuite_runComponentCreationSpeedBenchmarks(config = {} as Object)
	func = function(context)
		createObject("roUrlTransfer")
	end function
	runSpeedBenchmark("roUrlTransfer", func, invalid, 1000, config)

	func = function(context)
		createObject("roByteArray")
	end function
	runSpeedBenchmark("roByteArray", func, invalid, 1000, config)

	func = function(context)
		return createObject("roAssociativeArray")
	end function
	runSpeedBenchmark("roAssociativeArray create", func, invalid, 1000, config)


	func = function(context)
		createObject("roChannelStore")
	end function
	runSpeedBenchmark("roChannelStore", func, invalid, 1000, config)

	func = function(context)
		createObject("roDateTime")
	end function
	runSpeedBenchmark("roDateTime", func, invalid, 1000, config)

	func = function(context)
		createObject("roDeviceInfo")
	end function
	runSpeedBenchmark("roDeviceInfo", func, invalid, 1000, config)

	func = function(context)
		createObject("roEVPCipher")
	end function
	runSpeedBenchmark("roEVPCipher", func, invalid, 1000, config)

	func = function(context)
		createObject("roEVPDigest")
	end function
	runSpeedBenchmark("roEVPDigest", func, invalid, 1000, config)

	func = function(context)
		createObject("roFileSystem")
	end function
	runSpeedBenchmark("roFileSystem", func, invalid, 1000, config)

	func = function(context)
		createObject("roHdmiStatus")
	end function
	runSpeedBenchmark("roHdmiStatus", func, invalid, 1000, config)

	func = function(context)
		createObject("roHMAC")
	end function
	runSpeedBenchmark("roHMAC", func, invalid, 1000, config)

	func = function(context)
		createObject("roHttpAgent")
	end function
	runSpeedBenchmark("roHttpAgent", func, invalid, 1000, config)

	func = function(context)
		createObject("roInput")
	end function
	runSpeedBenchmark("roInput", func, invalid, 1000, config)

	func = function(context)
		createObject("roLocalization")
	end function
	runSpeedBenchmark("roLocalization", func, invalid, 1000, config)

	func = function(context)
		createObject("roMessagePort")
	end function
	runSpeedBenchmark("roMessagePort", func, invalid, 1000, config)

	func = function(context)
		createObject("roMicrophone")
	end function
	runSpeedBenchmark("roMicrophone", func, invalid, 1000, config)

	' TODO fix
	' func = function(context)
	' 	createObject("roRegistrySection")
	' end function
	' runSpeedBenchmark("roRegistrySection", func, invalid, 1000, config)

	func = function(context)
		createObject("roRSA")
	end function
	runSpeedBenchmark("roRSA", func, invalid, 1000, config)

	func = function(context)
		createObject("roRegistry")
	end function
	runSpeedBenchmark("roRegistry", func, invalid, 1000, config)

	' TODO fix
	' func = function(context)
	' 	createObject("roRegex")
	' end function
	' runSpeedBenchmark("roRegex", func, invalid, 1000, config)

	func = function(context)
		createObject("roTimespan")
	end function
	runSpeedBenchmark("roTimespan", func, invalid, 1000, config)
end sub

sub runComparisonBenchmark(name as String, versions as Object, contextOrContextFunc as Dynamic, iterations = 10000 as Integer, additionalConfig = {} as Object)
	config = {
		"includeIterationCount": false
		"runs": 1
		"iterationMultiplier": 1.0
	}
	config.append(additionalConfig)
	iterations = fix(config.iterationMultiplier * iterations)

	if config.benchmarkNamePrefix <> Invalid then
		name = config.benchmarkNamePrefix + ": " + name
	end if

	details = createObject("roDeviceInfo").getModelDetails()
	modelDescription = details.vendorName + " " + details.modelNumber
	firmwareVersion = createObject("roDeviceInfo").getVersion().mid(2, 3)
	print
	print "----- " name " (" iterations " iterations on " modelDescription " v" + firmwareVersion + ") -------------------------"

	t = createObject("roTimespan")
	for r = 1 to config.runs
		if config.runs > 1 then print "Run" r
		fastest = Invalid
		secondFastest = Invalid
		for each version in versions
			if type(contextOrContextFunc, 3) = "Function" then
				config.iterations = iterations
				config.version = version
				context = contextOrContextFunc(config)
			else
				context = contextOrContextFunc
			end if
			t.mark()
			if config.includeIterationCount then
				for i = 0 to (iterations - 1)
					version.func(context, i)
				end for
			else
				for i = 0 to (iterations - 1)
					version.func(context)
				end for
			end if
			version.duration = t.totalMilliseconds()
			print version.name " ====> took: " version.duration "ms total /" version.duration / iterations "ms per call"

			if fastest = Invalid or fastest.duration >= version.duration then
				fastest = version
			end if
		end for

		print

		for each version in versions
			if version.name <> fastest.name then
				timeDiff = version.duration - fastest.duration
				percent = 0
				if fastest.duration > 0 then percent = timeDiff / fastest.duration * 100
				print "'" fastest.name "' was faster than '" version.name "' by " timeDiff "ms " percent "% and will save " timeDiff / iterations "ms per call"
			end if
		end for
		print
		print
	end for
end sub


sub runSpeedBenchmark(name as String, functionToBenchmark as Function, contextOrContextFunc as Dynamic, iterations = 10000 as Integer, additionalConfig = {} as Object)
	config = {
		"includeIterationCount": false
		"runs": 1
		"iterationMultiplier": 1.0
	}
	config.append(additionalConfig)
	iterations = fix(config.iterationMultiplier * iterations)

	if config.benchmarkNamePrefix <> Invalid then
		name = config.benchmarkNamePrefix + ": " + name
	end if

	details = createObject("roDeviceInfo").getModelDetails()
	modelDescription = details.vendorName + " " + details.modelNumber
	firmwareVersion = createObject("roDeviceInfo").getVersion().mid(2, 3)
	print
	print "----- " name " (" iterations " iterations on " modelDescription " v" + firmwareVersion + ") -------------------------"
	t = createObject("roTimespan")
	for r = 1 to config.runs
		if config.runs > 1 then print "Run" r

		if type(contextOrContextFunc, 3) = "Function" then
			config.iterations = iterations
			config.version = version
			context = contextOrContextFunc(config)
		else
			context = contextOrContextFunc
		end if
		t.mark()
		if config.includeIterationCount then
			for i = 0 to (iterations - 1)
				functionToBenchmark(context, i)
			end for
		else
			for i = 0 to (iterations - 1)
				functionToBenchmark(context)
			end for
		end if
		totalDuration = t.totalMilliseconds()

		noopFunc = function(context) : end function
		noopFuncWithCount = function(context, i) : end function
		t.mark()
		if config.includeIterationCount then
			for i = 0 to (iterations - 1)
				noopFuncWithCount(context, i)
			end for
		else
			for i = 0 to (iterations - 1)
				noopFunc(context)
			end for
		end if
		loopDuration = t.totalMilliseconds()
		duration = totalDuration - loopDuration
		print "took: " duration "ms total /" duration / iterations "ms per call"

		print
		print
	end for
end sub

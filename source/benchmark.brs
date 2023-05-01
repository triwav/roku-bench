sub runComparisonBenchmark(name as String, versions as Object, contextOrContextFunc as Dynamic, iterations = 10000 as Integer, additionalConfig = {} as Object)
	config = {
		"includeIterationCount": false
		"runs": 1
		"iterationMultiplier": 1.0
		"typeChecking": "on"
		' TODO finish support
		"operationCount": 1 ' If you did a loop or multiple operations in your benchmark you can provide this to give a truer picture of how long a single operation would take
	}
	config.append(additionalConfig)
	iterations = fix(config.iterationMultiplier * iterations)

	prefix = config.benchmarkNamePrefix
	if prefix <> Invalid then
		name = prefix + ": " + name
	end if

	details = createObject("roDeviceInfo").getModelDetails()
	modelDescription = details.vendorName + " " + details.modelNumber
	firmwareVersion = createObject("roDeviceInfo").getVersion().mid(2, 3)
	print
	print "----- " name " (" iterations " iterations on " modelDescription " v" + firmwareVersion + ") -------------------------"
	thread = additionalConfig.thread
	if thread <> Invalid then
		isRenderThread = m.top <> Invalid
		if isRenderThread then
			correctThread = (thread = "render")
		else
			correctThread = (thread <> "render")
		end if

		if NOT correctThread
			print "Skipping benchmark as benchmark requested " thread " thread"
			print
			return
		end if
	end if

	t = createObject("roTimespan")
	for r = 1 to config.runs
		if config.runs > 1 then print "Run" r
		fastest = Invalid
		secondFastest = Invalid
		lastVersionOutput = "nil"
		for each version in versions
			if type(contextOrContextFunc, 3) = "Function" then
				config.iterations = iterations
				config.version = version
				context = contextOrContextFunc(config)
			else
				context = contextOrContextFunc
			end if
			if config.includeIterationCount then
				t.mark()
				for i = 0 to (iterations - 1)
					output = version.func(context, i)
				end for
			else
				t.mark()
				for i = 0 to (iterations - 1)
					versionOutput = version.func(context)
				end for
			end if
			version.duration = t.totalMilliseconds()
			timeForSingleCall = version.duration / iterations
			opsPerSecond = 1000 / timeForSingleCall * config.operationCount
			print version.name " ====> took: " version.duration "ms total /" opsPerSecond "ops/sec"

			typeChecking = config.typeChecking
			if typeChecking = "on" OR typeChecking = "loose" then
				if typeChecking = "loose" then
					lastVersionOutputType = type(box(lastVersionOutput))
					versionOutputType = type(box(versionOutput))
				else
					lastVersionOutputType = type(lastVersionOutput)
					versionOutputType = type(versionOutput)
				end if

				isString = (lastVersionOutputType = "String" OR lastVersionOutputType = "roString")

				failedMatchCheck = false
				if isString AND lastVersionOutput = "nil" then
					failedMatchCheck = false
				else if versionOutputType <> lastVersionOutputType then
					failedMatchCheck = true
				else if formatJson([versionOutput]) <> formatJson([lastVersionOutput]) then
					failedMatchCheck = true
				end if

				if failedMatchCheck then
					print "VERSION OUTPUT for '" version.name "' with value: '" versionOutput "' DID NOT MATCH previous value of '" lastVersionOutput "'!!!!!!!!!!!!!!!!!!!!!!!!"
					return
				end if
				lastVersionOutput = versionOutput
			else if typeChecking <> "off" then
				print "invalid value specified for typeChecking!!!!!!!!!!!!!!!!!!!!!!!!"
				return
			end if

			if fastest = Invalid OR fastest.duration >= version.duration then
				fastest = version
			end if
		end for

		print

		for each version in versions
			if version.name <> fastest.name then
				timeDiff = version.duration - fastest.duration
				percent = 0
				if fastest.duration > 0 then percent = timeDiff / fastest.duration * 100
				print "'" fastest.name "' was faster than '" version.name "' by" timeDiff "ms" percent "% and will save" timeDiff / iterations "ms per call"
			end if
		end for
		print
	end for
end sub


sub runSpeedBenchmark(name as String, functionToBenchmark as Function, contextOrContextFunc as Dynamic, iterations = 10000 as Integer, additionalConfig = {} as Object)
	config = {
		"includeIterationCount": false
		"runs": 1
		"iterationMultiplier": 1.0
		' TODO finish support
		"operationCount": 1 ' If you did a loop or multiple operations in your benchmark you can provide this to give a truer picture of how long a single operation would take
	}
	config.append(additionalConfig)
	iterations = fix(config.iterationMultiplier * iterations)

	prefix = config.benchmarkNamePrefix
	if prefix <> Invalid then
		name = prefix + ": " + name
	end if

	details = createObject("roDeviceInfo").getModelDetails()
	modelDescription = details.vendorName + " " + details.modelNumber
	firmwareVersion = createObject("roDeviceInfo").getVersion().mid(2, 3)
	print
	printStatement = "----- " + name + " (" + iterations.toStr() + " iterations"
	if config.operationCount > 1 then
		printStatement += " /" + config.operationCount.toStr() + " operations"
	end if
	print  printStatement " on " modelDescription " v" + firmwareVersion + ") -------------------------"

	thread = additionalConfig.thread
	if thread <> Invalid then
		isRenderThread = m.top <> Invalid
		if isRenderThread then
			correctThread = (thread = "render")
		else
			correctThread = (thread <> "render")
		end if

		if NOT correctThread
			print "Skipping benchmark as benchmark requested " thread " thread"
			print
			return
		end if
	end if
	t = createObject("roTimespan")
	for r = 1 to config.runs
		if config.runs > 1 then print "Run" r

		if type(contextOrContextFunc, 3) = "Function" then
			config.iterations = iterations
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
		timeForSingleCall = duration / iterations
		opsPerSecond = 1000 / timeForSingleCall * config.operationCount
		print name " ====> took: " duration "ms total /" opsPerSecond "ops/sec"

		print
		print
	end for
end sub

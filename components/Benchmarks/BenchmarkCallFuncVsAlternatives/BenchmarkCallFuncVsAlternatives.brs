sub init()
	iterations = 199
	versions = [
		{
			"name": "observeFieldScoped"
			"func": function(context, i)
				node = context[i]
				node.observeFieldScoped("output", "onNodeOutputChanged")
				node.output = true
			end function
		}, {
			"name": "promise"
			"func": function(context, i)
				node = context[i]
				promise = __createPromiseFromNode(node, "output", true).then(sub(value)
					flipped = (value = false)
				end sub)
				node.output = true
			end function
		}
	]

	contextFunc = function(config as Object) as Object
		nodes = []
		for i = 0 to config.iterations
			node = createObject("roSGNode", "Node")
			node.addField("output", "bool", false)
			nodes.push(node)
		end for
		return nodes
	end function
	runComparisonBenchmark("observeFieldScoped vs promise", versions, contextFunc, iterations, {"includeIterationCount": true})

	versions = [
		{
			"name": "observeField"
			"func": function(context)
				node = createObject("roSgNode", "ObserveField")
				for i = 0 to 200
					node.fire = true
				end for
				return node.output
			end function
		}, {
			"name": "observeFieldScoped"
			"func": function(context)
				node = createObject("roSgNode", "ObserveFieldScoped")
				for i = 0 to 200
					node.fire = true
				end for
				return node.output
			end function
		}, {
			"name": "onChange"
			"func": function(context)
				node = createObject("roSgNode", "OnChange")
				for i = 0 to 200
					node.fire = true
				end for
				return node.output
			end function
		}
	]
	runComparisonBenchmark("observeFieldScoped vs observeField vs onChange", versions, Invalid, iterations)

	versions = [
		{
			"name": "callFunc"
			"func": function(context, i)
				node = context.node
				node.callFunc("sendRequest", {
					"url": "http://roku.com"
				})
			end function
		}, {
			"name": "commands node"
			"func": function(context, i)
				node = context.node
				command = createObject("roSGNode", "Node")
				command.addFields({
					"type": "sendRequest"
					"context": {
						"url": "http://roku.com"
					}
				})
				node.commands.appendChild(command)
			end function
		}, {
			"name": "command port field"
			"func": function(context, i)
				node = context.node
				node.command = {
					"type": "sendRequest"
					"context": {
						"url": "http://roku.com"
					}
				}
				if i = context.iterations then node.sendCommands = true
			end function
		}, {
			"name": "commandsArray"
			"func": function(context, i)
				node = context.node
				command = {
					"type": "sendRequest"
					"context": {
						"url": "http://roku.com"
					}
				}
				if node.commandsArray.isEmpty() then
					node.commandsArray = [command]
				else
					commands = node.commandsArray
					commands.push(command)
					node.commandsArray = commands
				end if
			end function
		}
	]

	contextFunc = function(config as Object) as Object
		return {
			"node": createObject("roSGNode", "ObserverOptions")
			"iterations": config.iterations
		}
	end function

	runComparisonBenchmark("callFunc vs alternatives", versions, contextFunc, iterations, {"includeIterationCount": true})
	benchmarksComplete()
end sub

sub onNodeOutputChanged(message as Object)
	value = message.getData()
	flipped = (value = false)
end sub

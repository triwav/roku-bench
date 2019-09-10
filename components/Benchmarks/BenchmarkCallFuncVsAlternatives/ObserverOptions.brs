sub init()
	m.top.commands = createObject("roSGNode", "Node")
	m.top.commands.observeFieldScoped("change", "onCommandsChangeChanged")
	m.port = createObject("roMessagePort")
	m.top.observeFieldScoped("command", m.port)
	m.top.observeFieldScoped("sendCommands", "onSendCommands")
	m.top.observeFieldScoped("commandsArray", "onCommandsArrayChanged")

end sub

sub onCommandsChangeChanged()
	while true
		command = m.top.commands.getChild(0)
		if command = Invalid then return
		m.top.commands.removeChild(command)

		if command.type = "sendRequest" then
			sendRequest(command.context)
		end if
	end while
end sub

sub onCommandsArrayChanged(message as Object)
	commands = message.getData()
	for each command in commands
		if command.type = "sendRequest" then
			sendRequest(command.context)
		end if
	end for
	m.top.commandsArray = []
end sub

sub sendRequest(request as Object)
	url = request.url
end sub

sub onSendCommands()
	while true
		message = m.port.getMessage()
		if message = Invalid then return
		command = message.getData()
		if command.type = "sendRequest" then
			sendRequest(command.context)
		end if
	end while
end sub

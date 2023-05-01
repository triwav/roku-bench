sub init()
	m.top.observeFieldScoped("fire", "onFireChange")
end sub

sub onFireChange(event as Object)
	m.top.output = NOT m.top.output
end sub

sub init()
	m.top.observeField("fire", "onFireChange")
end sub

sub onFireChange(event as Object)
	m.top.output = NOT m.top.output
end sub

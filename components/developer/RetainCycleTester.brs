sub init()
	m.top.findNode("timer").observeFieldScoped("fire", "onFireChange")
end sub

sub onFireChange()
	label = m.top.label
	if label = "" then
		parent = m.top.getParent()
		if type(parent) = "roSGNode" then
			label = parent.subtype() + "(" + parent.id + ")"
		else
			label = m.top.subtype()
		end if
	end if
	message = label + " still around"
	print message
end sub

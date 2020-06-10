sub init()
	m.top.observeFieldScoped("aaObserver", "onFieldChange")
	m.top.observeFieldScoped("nodeObserver", "onFieldChange")
end sub

sub onFieldChange(event as Object)
	data = event.getData()
	data.body.len()
end sub

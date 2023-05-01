sub init()
	m.top.functionName = "taskThread"
	m.localBigAA = m.global.bigAA
end sub

sub taskThread()
	totalLength = 0
	for each key in m.localBigAA
		totalLength += m.localBigAA[key].len()
	end for
	m.top.result = totalLength
end sub

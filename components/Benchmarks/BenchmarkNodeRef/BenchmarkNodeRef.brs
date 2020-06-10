sub init()
	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				output += topRef.two
				output += topRef.three
				output += topRef.four
				output += topRef.five
				output += topRef.six
				output += topRef.seven
				output += topRef.eight
				output += topRef.nine
				output += topRef.ten
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				output += m.top.two
				output += m.top.three
				output += m.top.four
				output += m.top.five
				output += m.top.six
				output += m.top.seven
				output += m.top.eight
				output += m.top.nine
				output += m.top.ten
				return output
			end function
		}, {
			"name": "m.top.getFields()"
			"func": function(context)
				m = getGlobalAA()
				fields = m.top.getFields()
				output = ""
				output += fields.one
				output += fields.two
				output += fields.three
				output += fields.four
				output += fields.five
				output += fields.six
				output += fields.seven
				output += fields.eight
				output += fields.nine
				output += fields.ten
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 10 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				output += topRef.two
				output += topRef.three
				output += topRef.four
				output += topRef.five
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				output += m.top.two
				output += m.top.three
				output += m.top.four
				output += m.top.five
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 5 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				output += topRef.two
				output += topRef.three
				output += topRef.four
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				output += m.top.two
				output += m.top.three
				output += m.top.four
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 4 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				output += topRef.two
				output += topRef.three
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				output += m.top.two
				output += m.top.three
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 3 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				output += topRef.two
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				output += m.top.two
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 2 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				topRef = m.top
				output = ""
				output += topRef.one
				return output
			end function
		}, {
			"name": "m.top"
			"func": function(context)
				m = getGlobalAA()
				output = ""
				output += m.top.one
				return output
			end function
		}
	]
	runComparisonBenchmark("topRef vs m.top direct 1 variable", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				globalRef = m.global
				output = {
					"exitApplication": globalRef.exitApplication
					"boolean": globalRef.boolean
					"string": globalRef.string
					"integer": globalRef.integer
					"float": globalRef.float
				}
				return output
			end function
		}, {
			"name": "m.global"
			"func": function(context)
				m = getGlobalAA()
				output = {
					"exitApplication": m.global.exitApplication
					"boolean": m.global.boolean
					"string": m.global.string
					"integer": m.global.integer
					"float": m.global.float
				}
				return output
			end function
		}
	]
	runComparisonBenchmark("globalRef vs m.global direct 5 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				globalRef = m.global
				output = {
					"exitApplication": globalRef.exitApplication
					"boolean": globalRef.boolean
					"string": globalRef.string
					"integer": globalRef.integer
				}
				return output
			end function
		}, {
			"name": "m.global"
			"func": function(context)
				m = getGlobalAA()
				output = {
					"exitApplication": m.global.exitApplication
					"boolean": m.global.boolean
					"string": m.global.string
					"integer": m.global.integer
				}
				return output
			end function
		}
	]
	runComparisonBenchmark("globalRef vs m.global direct 4 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				globalRef = m.global
				output = {
					"exitApplication": globalRef.exitApplication
					"boolean": globalRef.boolean
					"string": globalRef.string
				}
				return output
			end function
		}, {
			"name": "m.global"
			"func": function(context)
				m = getGlobalAA()
				output = {
					"exitApplication": m.global.exitApplication
					"boolean": m.global.boolean
					"string": m.global.string
				}
				return output
			end function
		}
	]
	runComparisonBenchmark("globalRef vs m.global direct 3 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				globalRef = m.global
				output = {
					"exitApplication": globalRef.exitApplication
					"boolean": globalRef.boolean
				}
				return output
			end function
		}, {
			"name": "m.global"
			"func": function(context)
				m = getGlobalAA()
				output = {
					"exitApplication": m.global.exitApplication
					"boolean": m.global.boolean
				}
				return output
			end function
		}
	]
	runComparisonBenchmark("globalRef vs m.global direct 2 variables", versions, invalid, 5000)


	versions = [
		{
			"name": "m.topRef"
			"func": function(context)
				m = getGlobalAA()
				globalRef = m.global
				output = {
					"exitApplication": globalRef.exitApplication
				}
				return output
			end function
		}, {
			"name": "m.global"
			"func": function(context)
				m = getGlobalAA()
				output = {
					"exitApplication": m.global.exitApplication
				}
				return output
			end function
		}
	]
	runComparisonBenchmark("globalRef vs m.global direct 1 variables", versions, invalid, 5000)
	benchmarksComplete()
end sub

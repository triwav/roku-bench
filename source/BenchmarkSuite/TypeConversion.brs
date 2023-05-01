function BenchmarkSuite_typeConversionBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "context.toStr()"
			"func": function(context)
				return context.toStr()
			end function
		}, {
			"name": "strI(context).trim()"
			"func": function(context)
				return strI(context).trim()
			end function
		}
	]
	benchmarks["integerToString"] = {
		"name": "Integer To String"
		"versions": versions
		"contextOrContextFunc": 5
		"iterations": 10000
	}


	versions = [
		{
			"name": "context.toStr()"
			"func": function(context)
				return context.toStr()
			end function
		}, {
			"name": "str(context).trim()"
			"func": function(context)
				return str(context).trim()
			end function
		}
	]
	benchmarks["floatToString"] = {
		"name": "Float To String"
		"versions": versions
		"contextOrContextFunc": 5.4
		"iterations": 10000
	}

	versions = [
		{
			"name": "instr()/to(Int|Float)"
			"func": function(context)
				if context.instr(".") = -1 then
					return context.toInt()
				else
					return context.toFloat()
				end if
			end function
		}, {
			"name": "toFloat"
			"func": function(context)
				return context.toFloat()
			end function
		}, {
			"name": "val()"
			"func": function(context)
				return val(context)
			end function
		}
	]
	benchmarks["stringToNumber"] = {
		"name": "String To Number"
		"versions": versions
		"contextOrContextFunc": "5.0"
		"iterations": 10000
	}

	return benchmarks
end function

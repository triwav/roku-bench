function BenchmarkSuite_asTypeBenchmarks() as Object
	benchmarks = {}

	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnString = function (value)
					return value
				end function
				return returnString(context)
			end function
		}, {
			"name": "typed (as String)"
			"func": function(context)
				returnString = function (value as String) as String
					return value
				end function
				return returnString(context)
			end function
		}
	]
	benchmarks["typelessVsTypedStringParamAndReturn"] = {
		"name": "typeless vs typed string param and return"
		"versions": versions
		"contextOrContextFunc": "test string"
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnBoolean = function (value)
					return value
				end function
				return returnBoolean(context)
			end function
		}, {
			"name": "typed (as Boolean)"
			"func": function(context)
				returnBoolean = function (value as Boolean) as Boolean
					return value
				end function
				return returnBoolean(context)
			end function
		}
	]
	benchmarks["typelessVsTypedBooleanParamAndReturn"] = {
		"name": "typeless vs typed boolean param and return"
		"versions": versions
		"contextOrContextFunc": true,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnInteger = function (value)
					return value
				end function
				return returnInteger(context)
			end function
		}, {
			"name": "typed (as Integer)"
			"func": function(context)
				returnInteger = function (value as Integer) as Integer
					return value
				end function
				return returnInteger(context)
			end function
		}
	]
	benchmarks["typelessVsTypedIntegerParamAndReturn"] = {
		"name": "typeless vs typed integer param and return"
		"versions": versions
		"contextOrContextFunc": 3,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnObject = function (value)
					return value
				end function
				return returnObject(context)
			end function
		}, {
			"name": "typed (as Object)"
			"func": function(context)
				returnObject = function (value as Object) as Object
					return value
				end function
				return returnObject(context)
			end function
		}
	]
	benchmarks["typelessVsTypedObjectParamAndReturn"] = {
		"name": "typeless vs typed integer param and return"
		"versions": versions
		"contextOrContextFunc": [1, 2, 3],
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnString = function (value)
					return value
				end function
				return returnString(context)
			end function
		}, {
			"name": "typed (as String)"
			"func": function(context)
				returnString = function (value as String)
					return value
				end function
				return returnString(context)
			end function
		}
	]
	benchmarks["typelessVsTypedStringParam"] = {
		"name": "typeless vs typed string param"
		"versions": versions
		"contextOrContextFunc": "test string"
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnBoolean = function (value)
					return value
				end function
				return returnBoolean(context)
			end function
		}, {
			"name": "typed (as Boolean)"
			"func": function(context)
				returnBoolean = function (value as Boolean)
					return value
				end function
				return returnBoolean(context)
			end function
		}
	]
	benchmarks["typelessVsTypedBooleanParam"] = {
		"name": "typeless vs typed boolean param"
		"versions": versions
		"contextOrContextFunc": true,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnInteger = function (value)
					return value
				end function
				return returnInteger(context)
			end function
		}, {
			"name": "typed (as Integer)"
			"func": function(context)
				returnInteger = function (value as Integer)
					return value
				end function
				return returnInteger(context)
			end function
		}
	]
	benchmarks["typelessVsTypedIntegerParam"] = {
		"name": "typeless vs typed integer param"
		"versions": versions
		"contextOrContextFunc": 3,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnObject = function (value)
					return value
				end function
				return returnObject(context)
			end function
		}, {
			"name": "typed (as Object)"
			"func": function(context)
				returnObject = function (value as Object)
					return value
				end function
				return returnObject(context)
			end function
		}
	]
	benchmarks["typelessVsTypedObjectParam"] = {
		"name": "typeless vs typed object param"
		"versions": versions
		"contextOrContextFunc": [1, 2, 3],
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnString = function (value)
					return value
				end function
				return returnString(context)
			end function
		}, {
			"name": "typed (as String)"
			"func": function(context)
				returnString = function (value) as String
					return value
				end function
				return returnString(context)
			end function
		}
	]
	benchmarks["typelessVsTypedStringReturn"] = {
		"name": "typeless vs typed string return"
		"versions": versions
		"contextOrContextFunc": "test string"
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnBoolean = function (value)
					return value
				end function
				return returnBoolean(context)
			end function
		}, {
			"name": "typed (as Boolean)"
			"func": function(context)
				returnBoolean = function (value) as Boolean
					return value
				end function
				return returnBoolean(context)
			end function
		}
	]
	benchmarks["typelessVsTypedBooleanReturn"] = {
		"name": "typeless vs typed boolean return"
		"versions": versions
		"contextOrContextFunc": true,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}


	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnInteger = function (value)
					return value
				end function
				return returnInteger(context)
			end function
		}, {
			"name": "typed (as Integer)"
			"func": function(context)
				returnInteger = function (value) as Integer
					return value
				end function
				return returnInteger(context)
			end function
		}
	]
	benchmarks["typelessVsTypedIntegerReturn"] = {
		"name": "typeless vs typed integer return"
		"versions": versions
		"contextOrContextFunc": 3,
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}

	versions = [
		{
			"name": "typeless"
			"func": function(context)
				returnObject = function (value)
					return value
				end function
				return returnObject(context)
			end function
		}, {
			"name": "typed (as Object)"
			"func": function(context)
				returnObject = function (value) as Object
					return value
				end function
				return returnObject(context)
			end function
		}
	]
	benchmarks["typelessVsTypedObjectReturn"] = {
		"name": "typeless vs typed object return"
		"versions": versions
		"contextOrContextFunc": [1, 2, 3],
		"iterations": 100000
		"config": {
			"typeChecking": "loose"
		}
	}

	return benchmarks
end function

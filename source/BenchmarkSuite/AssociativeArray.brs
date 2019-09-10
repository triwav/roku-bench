function BenchmarkSuite_associativeArrayBenchmarks(config = {} as Object) as Object
	benchmarks = {}

	versions = [
		{
			"name": "1 character length keys"
			"func": function(context)
				return {
					"a": "a"
					"b": "b"
					"c": "c"
					"d": "d"
					"e": "e"
					"f": "f"
					"g": "g"
					"h": "h"
				}
			end function
		}, {
			"name": "2 character length keys"
			"func": function(context)
				return {
					"aa": "a"
					"bb": "b"
					"cc": "c"
					"dd": "d"
					"ee": "e"
					"ff": "f"
					"gg": "g"
					"hh": "h"
				}
			end function
		}, {
			"name": "3 character length keys"
			"func": function(context)
				return {
					"aaa": "a"
					"bbb": "b"
					"ccc": "c"
					"ddd": "d"
					"eee": "e"
					"fff": "f"
					"ggg": "g"
					"hhh": "h"
				}
			end function
		}, {
			"name": "4 character length keys"
			"func": function(context)
				return {
					"aaaa": "a"
					"bbbb": "b"
					"cccc": "c"
					"dddd": "d"
					"eeee": "e"
					"ffff": "f"
					"gggg": "g"
					"hhhh": "h"
				}
			end function
		}, {
			"name": "5 character length keys"
			"func": function(context)
				return {
					"aaaaa": "a"
					"bbbbb": "b"
					"ccccc": "c"
					"ddddd": "d"
					"eeeee": "e"
					"fffff": "f"
					"ggggg": "g"
					"hhhhh": "h"
				}
			end function
		}, {
			"name": "10 character length keys"
			"func": function(context)
				return {
					"aaaaaaaaaa": "a"
					"bbbbbbbbbb": "b"
					"cccccccccc": "c"
					"dddddddddd": "d"
					"eeeeeeeeee": "e"
					"ffffffffff": "f"
					"gggggggggg": "g"
					"hhhhhhhhhh": "h"
				}
			end function
		}, {
			"name": "20 character length keys"
			"func": function(context)
				return {
					"aaaaaaaaaaaaaaaaaaaa": "a"
					"bbbbbbbbbbbbbbbbbbbb": "b"
					"cccccccccccccccccccc": "c"
					"dddddddddddddddddddd": "d"
					"eeeeeeeeeeeeeeeeeeee": "e"
					"ffffffffffffffffffff": "f"
					"gggggggggggggggggggg": "g"
					"hhhhhhhhhhhhhhhhhhhh": "h"
				}
			end function
		}
	]
	benchmarks["creationKeyLengthEffect"] = {
		"name": "benchmark to see how AA key length effects create performance"
		"versions": versions
		"contextOrContextFunc": Invalid,
		"iterations": 100000
	}


	contextFunc = function(config as Object) as Object
		versionName = config.version.name
		if versionName = "1 character length keys" then
			return {
					"a": "a"
					"b": "b"
					"c": "c"
					"d": "d"
					"e": "e"
					"f": "f"
					"g": "g"
					"h": "h"
				}
		else if versionName = "2 character length keys" then
			return {
					"aa": "a"
					"bb": "b"
					"cc": "c"
					"dd": "d"
					"ee": "e"
					"ff": "f"
					"gg": "g"
					"hh": "h"
				}
		else if versionName = "3 character length keys" then
			return {
					"aaa": "a"
					"bbb": "b"
					"ccc": "c"
					"ddd": "d"
					"eee": "e"
					"fff": "f"
					"ggg": "g"
					"hhh": "h"
				}
		else if versionName = "4 character length keys" then
			return {
					"aaaa": "a"
					"bbbb": "b"
					"cccc": "c"
					"dddd": "d"
					"eeee": "e"
					"ffff": "f"
					"gggg": "g"
					"hhhh": "h"
				}
		else if versionName = "5 character length keys" then
			return {
					"aaaaa": "a"
					"bbbbb": "b"
					"ccccc": "c"
					"ddddd": "d"
					"eeeee": "e"
					"fffff": "f"
					"ggggg": "g"
					"hhhhh": "h"
				}
		else if versionName = "10 character length keys" then
			return {
					"aaaaaaaaaa": "a"
					"bbbbbbbbbb": "b"
					"cccccccccc": "c"
					"dddddddddd": "d"
					"eeeeeeeeee": "e"
					"ffffffffff": "f"
					"gggggggggg": "g"
					"hhhhhhhhhh": "h"
				}
		else if versionName = "20 character length keys" then
			return {
					"aaaaaaaaaaaaaaaaaaaa": "a"
					"bbbbbbbbbbbbbbbbbbbb": "b"
					"cccccccccccccccccccc": "c"
					"dddddddddddddddddddd": "d"
					"eeeeeeeeeeeeeeeeeeee": "e"
					"ffffffffffffffffffff": "f"
					"gggggggggggggggggggg": "g"
					"hhhhhhhhhhhhhhhhhhhh": "h"
				}
		end if
	end function

	versions = [
		{
			"name": "1 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.a
				concatString += context.b
				concatString += context.c
				concatString += context.d
				concatString += context.e
				concatString += context.f
				concatString += context.g
				concatString += context.h
				return concatString
			end function
		}, {
			"name": "2 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aa
				concatString += context.bb
				concatString += context.cc
				concatString += context.dd
				concatString += context.ee
				concatString += context.ff
				concatString += context.gg
				concatString += context.hh
				return concatString
			end function
		}, {
			"name": "3 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aaa
				concatString += context.bbb
				concatString += context.ccc
				concatString += context.ddd
				concatString += context.eee
				concatString += context.fff
				concatString += context.ggg
				concatString += context.hhh
				return concatString
			end function
		}, {
			"name": "4 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aaaa
				concatString += context.bbbb
				concatString += context.cccc
				concatString += context.dddd
				concatString += context.eeee
				concatString += context.ffff
				concatString += context.gggg
				concatString += context.hhhh
				return concatString
			end function
		}, {
			"name": "5 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aaaaa
				concatString += context.bbbbb
				concatString += context.ccccc
				concatString += context.ddddd
				concatString += context.eeeee
				concatString += context.fffff
				concatString += context.ggggg
				concatString += context.hhhhh
				return concatString
			end function
		}, {
			"name": "10 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aaaaaaaaaa
				concatString += context.bbbbbbbbbb
				concatString += context.cccccccccc
				concatString += context.dddddddddd
				concatString += context.eeeeeeeeee
				concatString += context.ffffffffff
				concatString += context.gggggggggg
				concatString += context.hhhhhhhhhh
				return concatString
			end function
		}, {
			"name": "20 character length keys"
			"func": function(context)
				concatString = ""
				concatString += context.aaaaaaaaaaaaaaaaaaaa
				concatString += context.bbbbbbbbbbbbbbbbbbbb
				concatString += context.cccccccccccccccccccc
				concatString += context.dddddddddddddddddddd
				concatString += context.eeeeeeeeeeeeeeeeeeee
				concatString += context.ffffffffffffffffffff
				concatString += context.gggggggggggggggggggg
				concatString += context.hhhhhhhhhhhhhhhhhhhh
				return concatString
			end function
		},
	]
	benchmarks["readKeyLengthEffect"] = {
		"name": "benchmark to see how AA key length effects read AA performance"
		"versions": versions
		"contextOrContextFunc": contextFunc,
		"iterations": 100000
	}


	versions = [
		{
			"name": "1 character length keys"
			"func": function(context)
				aa = {}
				aa.a = "a"
				aa.b = "b"
				aa.c = "c"
				aa.d = "d"
				aa.e = "e"
				aa.f = "f"
				aa.g = "g"
				aa.h = "h"
				return aa
			end function
		}, {
			"name": "2 character length keys"
			"func": function(context)
				aa = {}
				aa.aa = "a"
				aa.bb = "b"
				aa.cc = "c"
				aa.dd = "d"
				aa.ee = "e"
				aa.ff = "f"
				aa.gg = "g"
				aa.hh = "h"
				return aa
			end function
		}, {
			"name": "3 character length keys"
			"func": function(context)
				aa = {}
				aa.aaa = "a"
				aa.bbb = "b"
				aa.ccc = "c"
				aa.ddd = "d"
				aa.eee = "e"
				aa.fff = "f"
				aa.ggg = "g"
				aa.hhh = "h"
				return aa
			end function
		}, {
			"name": "4 character length keys"
			"func": function(context)
				aa = {}
				aa.aaaa = "a"
				aa.bbbb = "b"
				aa.cccc = "c"
				aa.dddd = "d"
				aa.eeee = "e"
				aa.ffff = "f"
				aa.gggg = "g"
				aa.hhhh = "h"
				return aa
			end function
		}, {
			"name": "5 character length keys"
			"func": function(context)
				aa = {}
				aa.aaaaa = "a"
				aa.bbbbb = "b"
				aa.ccccc = "c"
				aa.ddddd = "d"
				aa.eeeee = "e"
				aa.fffff = "f"
				aa.ggggg = "g"
				aa.hhhhh = "h"
				return aa
			end function
		}, {
			"name": "10 character length keys"
			"func": function(context)
				aa = {}
				aa.aaaaaaaaaa = "a"
				aa.bbbbbbbbbb = "b"
				aa.cccccccccc = "c"
				aa.dddddddddd = "d"
				aa.eeeeeeeeee = "e"
				aa.ffffffffff = "f"
				aa.gggggggggg = "g"
				aa.hhhhhhhhhh = "h"
				return aa
			end function
		}, {
			"name": "20 character length keys"
			"func": function(context)
				aa = {}
				aa.aaaaaaaaaaaaaaaaaaaa = "a"
				aa.bbbbbbbbbbbbbbbbbbbb = "b"
				aa.cccccccccccccccccccc = "c"
				aa.dddddddddddddddddddd = "d"
				aa.eeeeeeeeeeeeeeeeeeee = "e"
				aa.ffffffffffffffffffff = "f"
				aa.gggggggggggggggggggg = "g"
				aa.hhhhhhhhhhhhhhhhhhhh = "h"
				return aa
			end function
		},
	]
	benchmarks["writeKeyLengthEffect"] = {
		"name": "benchmark to see how AA key length effects write AA performance"
		"versions": versions
		"contextOrContextFunc": contextFunc,
		"iterations": 100000
	}

	return benchmarks
end function

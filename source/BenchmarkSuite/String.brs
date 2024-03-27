function BenchmarkSuite_stringBenchmarks() as Object
	benchmarks = {}

	versions = [{
			"name": "basicSprintfImplementation"
			"func": function(context)
				template = "The %s brown %s jumps %s the %s dog"
				replacements = ["quick", "fox", "over", "lazy"]

				parts = template.split("%s")
				output = ""
				lastPart = parts.pop()
				i = 0
				for each part in parts
					output += part + replacements[i]
					i++
				end for
				output += lastPart
				return output
			end function
		}, {
			"name": "ifStringOps.replace"
			"func": function(context)
				expandedString = "The {secondWord} brown {fourthWord} jumps {sixthWord} the {eighthWord} dog"
				replacements = {
					"secondWord": "quick"
					"fourthWord": "fox"
					"sixthWord": "over"
					"eighthWord": "lazy"
				}

				for each key in replacements
					expandedString = expandedString.replace("{" + key + "}", replacements[key])
				end for
				return expandedString
			end function
		}, {
			"name": "ifRegex.matchAll and ifStringOps.replace"
			"func": function(context)
				expandedString = "The {secondWord} brown {fourthWord} jumps {sixthWord} the {eighthWord} dog"
				replacements = {
					"secondWord": "quick"
					"fourthWord": "fox"
					"sixthWord": "over"
					"eighthWord": "lazy"
				}
				r = createObject("roRegex", "{([a-z]+)}", "i")
				matches = r.matchAll(expandedString)

				for each match in matches
					expandedString = expandedString.replace(match[0], replacements[match[1]])
				end for
				return expandedString
			end function
		}, {
			"name": "substitute"
			"func": function(context)
				template = "The {0} brown {1} jumps {2} the {3} dog"
				return substitute(template, "quick", "fox", "over", "lazy")
			end function
		}, {
			"name": "hard coded concat single line"
			"func": function(context)
				return "The " + "quick" + " brown " + "fox" + " jumps " + "over" + " the " + "lazy" + " dog"
			end function
		}, {
			"name": "join() concat"
			"func": function(context)
				replacements = ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
				return replacements.join(" ")
			end function
		}
	]
	benchmarks["stringTemplating"] = {
		"name": "String Templating"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick"
		end function
	}]
	benchmarks["concat2Items"] = {
		"name": "Concat Two Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown"
		end function
	}]
	benchmarks["concat3Items"] = {
		"name": "Concat Three Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox"
		end function
	}]
	benchmarks["concat4Items"] = {
		"name": "Concat Four Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox", "jumps"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox " + "jumps"
		end function
	}]
	benchmarks["concat5Items"] = {
		"name": "Concat Five Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox", "jumps", "over"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox " + "jumps " + "over"
		end function
	}]
	benchmarks["concat6Items"] = {
		"name": "Concat Six Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox", "jumps", "over", "the"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox " + "jumps " + "over " + "the"
		end function
	}]
	benchmarks["concat7Items"] = {
		"name": "Concat Seven Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox " + "jumps " + "over " + "the " + "lazy"
		end function
	}]
	benchmarks["concat8Items"] = {
		"name": "Concat Eight Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "join() concat"
		"func": function(context)
			return ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"].join(" ")
		end function
	}, {
		"name": "concat"
		"func": function(context)
			return "The " + "quick " + "brown " + "fox " + "jumps " + "over " + "the " + "lazy " + "dog"
		end function
	}]
	benchmarks["concat9Items"] = {
		"name": "Concat Nine Items"
		"versions": versions
		"contextOrContextFunc": Invalid
		"iterations": 5000
	}


	versions = [{
		"name": "split"
		"func": function(context)
			return context.split(".")
		end function
	}, {
		"name": "tokenize"
		"func": function(context)
			return context.tokenize(".").toArray()
		end function
	}]
	benchmarks["tokenizeVsSplit"] = {
		"name": "Tokenize vs Split"
		"versions": versions
		"contextOrContextFunc": "controller.authManager.user.email.domain"
		"iterations": 5000
	}

	return benchmarks
end function

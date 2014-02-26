function sanitize(text)
	local new, times = string.gsub(text, "##", "#")
	return new
end


function urlencode(char)
    local encoded = string.gsub (char, "([^%w])",
        function(c)
            return string.format("%%%02X", string.byte(c))
        end)
    return encoded
end


function texencode(text)
	local new, times = string.gsub(text, "%%", "\\%%")
	return new
end


function prepare(text)
	local result = text
	result = sanitize(result)
	result = urlencode(result)
	result = texencode(result)
	return result
end
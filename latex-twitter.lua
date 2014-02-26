function urlencode(char)
    local encoded = string.gsub (char, "([^%w])",
        function(c)
            return string.format("%%%02X", string.byte(c))
        end)
    return encoded
end

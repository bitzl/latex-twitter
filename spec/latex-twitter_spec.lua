require("busted")
require("latex-twitter")

describe("Sanitize the input from TeX", function()
    it("should replace ## by #", function()
        assert.same("#", sanitize("##"))
    end)
    it("should not change regular text", function()
        text = "57ad554d8b504d4f80162831ab69e0fb"
        assert.same(text, sanitize(text))
    end)
end)


describe("Encoding of URLs", function()
    it("should encode hashtags", function()
        assert.same("%23", urlencode("#"))
    end)
    it("should encode spaces", function()
        assert.same("%20", urlencode(" "))
    end)
    it("should encode questionmarks", function()
        assert.same("%3F", urlencode("?"))
    end)
    it("should encode ampersands", function()
        assert.same("%26", urlencode("&"))
    end)
    it("should encode letters", function()
        assert.same("a", urlencode("a"))
    end)
    it("should encodes URLs", function ()
        assert.same("http%3A%2F%2Fwww%2Eexample%2Ecom%2Findex%2Ephp%3Fid%3D123%26name%3DTest", urlencode("http://www.example.com/index.php?id=123&name=Test"))
    end)
end)


describe("Encode the str for TeX", function()
    it("should replace ## by #", function()
        assert.same("\\%", texencode("%"))
    end)
    it("should not change regular text", function()
        text = "57ad%2055%204"
        assert.same("57ad\\%2055\\%204", texencode("57ad%2055%204"))
    end)
end)


describe("Prepare text (the whole stack)", function ()
    it("shold not change a regular text", function ()
        text = "1ebf60d5e753443882cd9e33a4c21c87"
        assert.same(text, prepare(text))
    end)
    it("shold not change a regular text but spaces", function ()
        assert.same("1ebf6\\%200d\\%205e7534438\\%2082cd9e33a\\%204c21c87",
                    prepare("1ebf6 0d 5e7534438 82cd9e33a 4c21c87"))
    end)
end)

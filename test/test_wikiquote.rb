require 'test/unit'
require 'wikiquote'

class XKCDTest < Test::Unit::TestCase
    def test_XKCD_get
        assert WikiQuote.get
    end

    def test_quote
        # Assert that it has the correct format,
        # which includes no newlines
        refute WikiQuote.quote.include?("\n")
        # and has a non-whitespace first character
        refute WikiQuote.quote[0][/\s/]
        # and last character.
        refute WikiQuote.quote[-1][/\s/]
    end

    def test_author
        # Assert that it has the correct format,
        # which includes no newlines
        refute WikiQuote.author.include?("\n")
        # and has a non-whitespace first character
        refute WikiQuote.author[0][/\s/]
        # and last character.
        refute WikiQuote.author[-1][/\s/]
    end
end

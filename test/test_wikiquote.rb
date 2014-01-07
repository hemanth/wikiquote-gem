require 'test/unit'
require 'wikiquote'

class XKCDTest < Test::Unit::TestCase
    def test_XKCD_get
        assert_not_nil WikiQuote.get
    end
end

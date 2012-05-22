#!/usr/bin/evn ruby
require 'net/http'
require 'open-uri'
require 'nokogiri'
# The main wiki driver
class WikiQuote
    # Get quote of the day from wikiquotes
    #
    # Example:
    #   >> WikiQuote.get()
    #   => "Ruby rocks" 
    def self.get()
        # Gets the quote of the day 
        quote_url = 'http://en.wikiquote.org/wiki/Main_Page'
        quote_selector = "td , #mw-content-text div div:nth-child(1)" # Hope this remians ;) 
        page = Nokogiri::HTML(open(quote_url).read)
        page.css(quote_selector)[3].text
    end
end

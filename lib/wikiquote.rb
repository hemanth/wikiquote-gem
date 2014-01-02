#! /usr/bin/env ruby
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
        quote_url = "http://en.wikiquote.org/wiki/Main_Page"
        
        # Hope this remains ;)
        quote_selector = "td , #mw-content-text div div:nth-child(1)"
        
        page = Nokogiri::HTML(open(quote_url).read)
        page.css(quote_selector)[3].text
    end
end

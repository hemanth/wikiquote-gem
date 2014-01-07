#! /usr/bin/env ruby
require 'net/http'
require 'open-uri'
require 'nokogiri'

# The main wiki driver
module WikiQuote
    # Every function should be a module_function
    # so that users can run them.
    extend self
    
    # Get quote of the day from WikiQuote.
    #
    # Example:
    #   >> WikiQuote.get()
    #   => "Ruby rocks" 
    def quote_of_the_day
        quote_url = "http://en.wikiquote.org/wiki/Main_Page"
        
        # Hope this remains ;)
        quote_selector = "td , #mw-content-text div div:nth-child(1)"
        
        page = Nokogiri::HTML(open(quote_url).read)
        page.css(quote_selector)[3].text
    end

    alias_method :get, :quote_of_the_day
    alias_method :qotd, :quote_of_the_day

    # Gets only the quote in the quote of the day.
    #
    # First, the start of the author portion of the quote of the day
    # to the end of the string is removed from the future string.
    # Then, the characters before any characters A-Z, a-z, or 0-9
    # are removed from the start of the string, and whitespace is
    # removed from the end of the string using regular expressions.
    def quote
        quote_of_the_day[0...second_to_last_index(quote_of_the_day, "~")].gsub(/(\A[^a-zA-z0-9]*|\s*\z)/, "")
    end

    # Gets the author of the quote of the day.
    #
    # Wikiquote contains this within tildes (~), which makes it easy to find.
    # One just has to get the substring of the quote between the second to last tilde and the last tilde.
    # This method gets that string (example "~ Isaac Asimov ~"),
    # then removes the "~ " at the beginning of the string and
    # " ~" at the end of the string, using regular expressions.
    def author
        quote_of_the_day[second_to_last_index(quote_of_the_day, "~")..quote_of_the_day.rindex("~")].gsub(/(\A~\s*|\s*~\z)/, "")
    end

    private
    def second_to_last_index(string, search)
        string.rindex(search, string.rindex(search) - 1)
    end
end

require "net/http"
require "uri"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'
# require 'pry'

  ##########################
  ## Project Requirements:

  #1) displaying a prompt for the user
  #2) parsing user input
  #3) fetching a web page
  #4) extracting the relevant information from the web page
  #5) displaying the relevant information in a user-friendly way
  ##########################

class Page
  attr_reader :url, :title, :links

  def initialize(args = {})
    puts "Initializing ..."
    @url = nil
    @title = nil
    @links = [['Requested URL', 'URL Title', 'Link Description', 'Link Address']]
    @links_hash = {}
  end

  def page_scraper(url)
    puts "Scraping doc ..."
    @url = url
    uri = URI(@url)
    net_doc = Net::HTTP.get(uri) # => String
    @doc = Nokogiri::HTML(net_doc)
    @doc
  end

  def title_parser
    puts "Parsing title ..."
    @title = @doc.css('title').text
    @title
  end

  def link_parser
    puts "Parsing links ..."
    @doc.xpath('//a[@href]').each do |link|
      @links_hash[link.text.strip] = link['href']
    end
    @links_hash
  end

  def results_formatter
    @links_hash.each do |k,v|
      link_description = k
      link_address = v
      @links << [@url, @title, link_description, "#{@website}#{link_address}"]
    end
    @links
  end

  def results_printer
    p @links
  end

  def to_csv
    success = nil
    CSV.open('scraper_results.csv', 'a+') do |csv|
      @links.each do |row|
        csv << row
        success = true
      end

      if success
        puts "CSV Successfully Saved!"
      else
        puts "Error: CSV not Saved."
      end

    end
  end

  def auto_complete(url)
    page_scraper(url)
    title_parser
    link_parser
    results_formatter
    results_printer
    to_csv
  end

end
###################################################
# class Runner
#   def initialize(args = {})
#     @starter = starter
#     @input = nil
#     @websites = []  ## => Array of websites from input.
#   end
#
#   def starter
#     puts "Welcome to the web scraper!\nEnter the website(s) you would like to crawl in their full format;\nex. 'http://www.cnn.com/', each separated with a space."
#
#     @input = gets.chomp
#     @websites = @input.split(' ')
#     confirmer
#   end
#
#   def confirmer
#     puts "Please confirm the following pages to crawl..."
#     i = @websites.length-1
#     @websites.each do |web|
#       puts "#{i}) #{web}"
#       i+=1
#     end
#     menu
#   end
#
#   def menu
#     puts "Enter...'Add' to add more websites, or 'Go' to start the scraper."
#     @input = gets.chomp
#     stop = false
#
#     while stop == false
#       if @input == 'Add'
#         puts "\nEnter the website(s) you would like to crawl in their full format;\nex. 'http://www.cnn.com/', each separated with a space."
#         @input = gets.chomp
#         temp_arr = []
#         temp_arr = @input.split(' ')
#         @websites += temp_arr
#         confirmer
#         stop = true
#       elsif @input == 'Go'
#         page_starter
#         stop = true
#       else
#         puts "Sorry, please enter a valid command."
#         menu
#       end
#     end
#   end
#
#   def page_starter
#     @websites.each do |website|
#       @results = Page.new.auto_complete(website)
#     end
#     @results
#   end
#
# end

###### Runner (Runner Class) #########
# run = Runner.new

=begin
https://devbootcamp.com http://www.cnn.com
http://www.foxnews.com https://www.c-span.org
=end

###### Runner (Page Class) #########
# website = 'https://devbootcamp.com'
website = 'http://www.cnn.com/'
#
page = Page.new
# # page.page_scraper(website)
# # page.title_parser
# # page.link_parser
# # page.results_formatter
# # puts page.results_printer
# puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"
# page.auto_complete(website)
# puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"









####################

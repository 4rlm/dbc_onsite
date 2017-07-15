## 1) Net::HTTP
# http://ruby-doc.org/stdlib-2.1.0//libdoc/net/http/rdoc/Net/HTTP.html

###################

## 2) Net::HTTP Cheat Sheet
# http://www.rubyinside.com/nethttp-cheat-sheet-2940.html

# require "net/http"
# require "uri"
#
# uri = URI.parse('https://devbootcamp-curriculum.github.io/cafeteria/')
#
# # Shortcut
# response = Net::HTTP.get_response(uri)
#
# # Will print response.body
# Net::HTTP.get_print(uri)
#
# # Full
# http = Net::HTTP.new(uri.host, uri.port)
# response = http.request(Net::HTTP::Get.new(uri.request_uri))
#
# puts response

###################

## 3) Ruby Net::HTTP cheat sheet
## https://github.com/augustl/net-http-cheat-sheet

##########################

## Project Requirements:

#1) displaying a prompt for the user
#2) parsing user input
#3) fetching a web page
#4) extracting the relevant information from the web page
#5) displaying the relevant information in a user-friendly way


##########################

require "net/http"
require "uri"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'


##############
# website = 'https://devbootcamp.com'
website = 'http://www.cnn.com/'

uri = URI(website)
net_doc = Net::HTTP.get(uri) # => String
# doc = Nokogiri::HTML(open(net_doc)) ## => if not using Net::HTTP...
doc = Nokogiri::HTML(net_doc)
puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"

puts doc

###############
## Page Environment
# puts doc
# puts doc.css('li/h1')[0].text
##############
# title = doc.css('title').text
# body = doc.css('body').text
body = doc.css('body')
body_hrefs = body.css('a')

puts body_hrefs
# puts body


puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"

# links = doc.css('a').text
# links = doc.css('a').map { |link| link['href'] }
##############
# Headers:
# headings = doc.css('h1').text
# puts headings
###############
# Get Links & Description to Hash
# links_hash = {}
# doc.xpath('//a[@href]').each do |link|
#   links_hash[link.text.strip] = link['href']
# end
#
# links_hash.each do |k,v|
#   puts "#{k}:#{v}"
# end
###########################################
























######## FINAL RESULT ########
# Get Title
# title = doc.css('title').text

# Get Links & Description to Hash
# links_hash = {}
# doc.xpath('//a[@href]').each do |link|
#   links_hash[link.text.strip] = link['href']
# end

# Puts Results
# puts website
# puts "#{title}\n\n"
# links_hash.each do |k,v|
#   puts "#{k}: #{website}#{v}"
# end

##########################################





















###################

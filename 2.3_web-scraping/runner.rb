require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

puts "Loading ..."

class Scraper

  def initialize(args = {})
    @headers = args.fetch(:headers, [])
    @output_file = args.fetch(:output_file, nil)
    @url = args.fetch(:url)
    @doc = open_page(@url)
    @menu = []
  end

  def open_page(address)
    Nokogiri::HTML(open(address))
  end

  def headers(array)
    @menu << array
  end

  def start_scrape
    i = 0
    menu_item_count = @doc.css('li/h1').length
    while i < menu_item_count
      @item = @doc.css('li/h1')[i].text
      @price = @doc.css('li/div').css('.menu-list-item_price')[i].text
      @description = @doc.css('li/div').css('.menu-list-item-sides')[i].text
      @menu << [@item, @description, @price]
      i+=1
    end
    puts "Page Successfully Scraped!"
    if @output_file
      to_csv(@output_file)
    else
      puts "No CSV saved!"
    end
  end

  def to_csv(file_name)
    success = nil
    CSV.open(file_name, "wb") do |csv|
      @menu.each do |row|
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

end


caf = Scraper.new({url:'https://devbootcamp-curriculum.github.io/cafeteria/', headers:['item', 'price', 'description'], output_file: './menu.csv' })
caf.start_scrape










###################

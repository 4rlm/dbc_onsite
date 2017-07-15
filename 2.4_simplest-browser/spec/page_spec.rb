
require_relative '../page'

# ["San Diego: https://devbootcamp.com/locations/san-diego"]
# [{ 'title': }]


describe Page do
  # let(:page) { Page.new(url: 'http://somedomain.com', heading: 'First H1 Heading', character_count: 1000, links: ['http://anotherdomain.com', 'http://somedomain.com/register']) }

  let(:page) { Page.new }
  let(:url) { 'http://google.com' }
  let(:title) { 'First H1 Heading' }

  it 'has a url' do
    response = page.page_scraper(url)
    expect(page.url).to eq 'http://google.com'
  end

  it 'returns a Nokogiri string object' do
    response = page.page_scraper(url)
    expect(response).to be_a(Nokogiri::HTML::Document)
  end

  it 'has a heading' do
    # expect(page.title_parser).to eq 'First H1 Heading'
    response = page.page_scraper(url)
    expect(response).to be_a(Nokogiri::HTML::Document)
  end

  # it 'has a character count' do
  #   expect(page.character_count).to eq 1000
  # end

  it 'has a collection of links' do
    expect(page.links).to match_array [["Requested URL", "URL Title", "Link Description", "Link Address"]]
  end

  it 'link parser populates links' do
    real_page.link_parser
    expect(real_page.links.length).to eq 26
  end
end

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'creates tags based in a page' do
    url = 'https://google.com/'
    page = Page.new
    require 'open-uri'
    doc = Nokogiri::HTML(open(url))
    tag_types = TagType.all
    doc.xpath('//h1', '//h2', '//h3', '//a').each do |element|
      assert_not_nil(Tag.create_tag(element.name, element.content, tag_types, page))
      assert_not_empty(page.tags)
    end
  end

  test 'index page with given correct url' do
    url = 'https://google.com/'
    page = Page.new
    assert(page.index_page(url))
  end

  test 'index page with given bad formed url' do
    url = 'https:||www.google.com/'
    page = Page.new
    assert_not(page.index_page(url))
  end

  test 'index page with given non existing url' do
    url = 'https://www.googleadasdasdasdasdads.com/'
    page = Page.new
    assert_not(page.index_page(url))
  end
end

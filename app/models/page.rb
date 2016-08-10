class Page < ActiveRecord::Base
  has_many :tags

# params @url [String] a string formatted as url
# return [true] if indexed successfully, [false] if not
def index_page(url)
  valid_url = uri?(url)
  if valid_url
    begin
      doc = Nokogiri::HTML(open(url))
      tag_types = TagType.all
      prepended_tag_types = tag_types.map{|tag_type| tag_type.prepend('//')}
      doc.xpath('//h1', '//h2', '//h3', '//a').each do |element|
        t = create_tag(element.name, element.content, tag_types)
        tags_to_be_inserted = []
        tags_to_be_inserted << t
        self.tags = tags_to_be_inserted
      end
    rescue
      valid_url = false
    end
  end
  valid_url
end

# params @element_name [String] a string with the name from an HTML element, i.e h1
# return t [Tag]
def create_tag(element_name, element_content, tag_types)
  t = Tag.new
  t.page = self
  t.tag_type = tag_types.select{ |tag_type| tag_type.name == element_name }.first
  t.content = element_content
  t.save!
  t
end

private

# params @string [String] a string with the uri to be validated
# return true or false [Boolean] if is a valid uri
def uri?(string)
  uri = URI.parse(string)
  %w(http https).include?(uri.scheme)
rescue URI::BadURIError
  false
rescue URI::InvalidURIError
  false
end
end

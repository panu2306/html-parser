class Page < ActiveRecord::Base
  include Linkable
  has_many :tags

  # params @url [String] a string formatted as url
  # return [true] if indexed successfully, [false] if not
  def index_page(url)
    valid_url = uri?(url)
    if valid_url
      begin
        tags_to_be_inserted = []
        require 'open-uri'
        doc = Nokogiri::HTML(open(url))
        tag_types = TagType.all
        prepended_tag_types = tag_types.collect { |tag_type| tag_type.name.prepend('//') }
        doc.xpath(*prepended_tag_types).each do |element|
          t = Tag.create_tag(element.name, element.content, tag_types, self)
          tags_to_be_inserted << t
        end
        self.tags = tags_to_be_inserted
      rescue
        valid_url = false
      end
    end
    valid_url
  end

end

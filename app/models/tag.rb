class Tag < ActiveRecord::Base
  belongs_to :page
  belongs_to :tag_type

  # params @element_name [String] a string with the name from an HTML element, i.e h1
  # return t [Tag]
  def self.create_tag(element_name, element_content, tag_types, page)
    t = Tag.new
    t.page = page
    t.tag_type = tag_types.select { |tag_type| tag_type.name == element_name }.first
    # Found pagegs with invalid byte sequence, need to replace it before database
    t.content = element_content.encode('UTF-8', invalid: :replace)
    t.save!
    t
  end
end

class Tag < ActiveRecord::Base
  belongs_to :page
  belongs_to :tag_type
end

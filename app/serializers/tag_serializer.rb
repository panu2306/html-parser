class TagSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :tag_type
end

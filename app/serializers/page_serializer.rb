class PageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_many :tags
end

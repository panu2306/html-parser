module Linkable
  extend ActiveSupport::Concern
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

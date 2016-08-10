module API
  class Base < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    mount API::V1::Base
  end
end

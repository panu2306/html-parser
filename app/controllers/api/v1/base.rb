require 'grape-swagger'

module API
  module V1
    class Base < Grape::API
      rescue_from :all do |e|
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
        error!(error: "#{e.class} error",
               message: e.message,
               status: e.try(:status).present? ? e.status : 404)
      end

      mount API::V1::Pages
      # mount API::V1::AnotherResource
      add_swagger_documentation api_version: 'v1'
    end
  end
end

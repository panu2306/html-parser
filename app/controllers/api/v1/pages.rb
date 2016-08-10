module API
  module V1
    class Pages < Grape::API
      include API::V1::Defaults

      resource :pages do
        desc 'Return all pages'
        get '', root: :pages do
          Page.all
        end

        desc 'Return one page'
        params do
          requires :id, type: Integer, desc: 'ID of the page/url'
        end
        get ':id', root: :pages do
          Page.find(params[:id])
        end

        desc 'Index the content of one page'
        params do
          requires :url, type: String, desc: 'The URL of a page to be indexed'
        end
        post do
          page = Page.new
          page.url = params[:url]
          if !page.index_page(params[:url]) && !page.save
            { status: false, error_code: 404, error_message: 'Error indexing the page' }
          else
            { status: true, message: 'Page successfully indexed' }
          end
        end
      end
    end
  end
end

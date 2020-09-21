require 'swagger_helper'

RSpec.describe 'comments', type: :request do

  path '/comments' do
    get(summary: 'list comments') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    post(summary: 'create comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/comments/new' do
    get(summary: 'new comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/comments/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '123' }

    get(summary: 'edit comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '123' }

    get(summary: 'show comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    patch(summary: 'update comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    put(summary: 'update comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    delete(summary: 'delete comment') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end

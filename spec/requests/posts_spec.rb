require 'swagger_helper'

RSpec.describe 'posts', type: :request do
  path '/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }

    get(summary: 'list posts') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    post(summary: 'create post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{user_id}/posts/new' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }

    get(summary: 'new post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{user_id}/posts/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }
    let(:id) { '123' }

    get(summary: 'edit post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{user_id}/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }
    let(:id) { '123' }

    get(summary: 'show post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    patch(summary: 'update post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    put(summary: 'update post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    delete(summary: 'delete post') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/posts' do
    get(summary: 'list posts') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end

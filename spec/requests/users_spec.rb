require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/users/{user_id}/users/{id}/follow' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }
    let(:id) { '123' }

    post(summary: 'follow user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{user_id}/users/{id}/unfollow' do
    # You'll want to customize the parameter types...
    parameter 'user_id', in: :path, type: :string
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:user_id) { '123' }
    let(:id) { '123' }

    post(summary: 'unfollow user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users' do
    get(summary: 'list users') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    post(summary: 'create user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/new' do
    get(summary: 'new user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '123' }

    get(summary: 'edit user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/users/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '123' }

    get(summary: 'show user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    patch(summary: 'update user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    put(summary: 'update user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    delete(summary: 'delete user') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "card_connect"

require 'minitest/autorun'
require 'minitest/pride'

require_relative 'api_request_stubs'
require_relative 'api_response_stubs'

include CardConnect::Utils

CardConnect.configure do |config|
  config.merchant_id = 'merchant123'
  config.api_username = 'testuser'
  config.api_password = 'testpass'
  config.card_pointe_endpoint = 'https://test.cardpointe.com'
  config.bolt_endpoint = 'https://test.bolt.com'
  config.bolt_authorization = 'test-bolt-auth'
  config.bolt_session_key = 'test-session-key'
end

# Stub out the CardPointe Faraday connection for testing
module CardConnect
  module CardPointe
    class Connection
      def connection
        @connection ||= Faraday.new(faraday_options) do |faraday|
          faraday.request :authorization, :basic, @config.api_username, @config.api_password
          faraday.request :json

          faraday.response :json, content_type: /\bjson$/
          faraday.response :raise_error

          faraday.adapter :test do |stubs|
            yield(stubs) if block_given?
          end
        end
      end
    end
  end
end

# Stub out the Bolt Faraday connection for testing
module CardConnect
  module Bolt
    class Connection
      def connection
        @connection ||= Faraday.new(faraday_options) do |faraday|
          faraday.request :json

          faraday.response :json, content_type: /\bjson$/
          faraday.response :raise_error

          faraday.adapter :test do |stubs|
            yield(stubs) if block_given?
          end
        end
      end
    end
  end
end

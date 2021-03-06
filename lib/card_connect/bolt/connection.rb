require 'faraday'
require 'faraday_middleware'

module CardConnect
  module Bolt

    class Connection
      def initialize(config = CardConnect.configuration)
        @config = config
      end

      def connection
        @connection ||= Faraday.new(faraday_options) do |f|
          f.request :json

          f.response :json, content_type: /\bjson$/
          f.response :raise_error

          f.adapter Faraday.default_adapter
        end
      end

      def ping_server
        connection.get('/api/v2/')
      rescue Faraday::ResourceNotFound => e
        return e
      rescue Faraday::ClientError => e
        return e
      end

      def faraday_options
        {
            url: @config.bolt_endpoint,
            request: {
                timeout: 100
            },
            headers: {
                'Authorization': (@config.bolt_authorization || ''),
                'X-CardConnect-SessionKey': (@config.bolt_session_key || ''),
                'Content-Type': 'application/json'
            },
        }.merge(@config.connection_options)
      end
    end

  end
end
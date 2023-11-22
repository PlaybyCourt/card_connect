module CardConnect
  module Bolt
    class Tip < BoltEndpoint
      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = Connection.new.connection)
        super(connection)
        @resource_name = '/tip'
        @rest_method = 'post'
      end

      def path
        '/api/v3' + @resource_name
      end

    end
  end
end
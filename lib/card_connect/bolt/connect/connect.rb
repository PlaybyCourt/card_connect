module CardConnect
  module Bolt
    class Connect < BoltEndpoint
      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = Connection.new.connection)
        super(connection)
        @resource_name = '/connect'
        @rest_method = 'put'
      end

    end
  end
end
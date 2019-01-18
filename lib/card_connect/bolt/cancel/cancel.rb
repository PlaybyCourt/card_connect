module CardConnect
  module Bolt
    class Cancel < BoltEndpoint
      # Initializes an Authorization Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Authorization
      def initialize(connection = Connection.new.connection)
        super(connection)
        @resource_name = '/cancel'
        @rest_method = 'post'
      end

    end
  end
end
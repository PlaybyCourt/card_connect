module CardConnect
  module CardPointe
    class Void < CardPointeEndpoint
      # Initializes a Void Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Void
      def initialize(connection = CardConnect.connection)
        super(connection)
        @resource_name = '/void'
        @rest_method = 'put'
      end
    end
  end
end
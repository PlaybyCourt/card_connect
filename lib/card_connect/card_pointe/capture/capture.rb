module CardConnect
  module CardPointe
    class Capture < CardPointeEndpoint
      # Initializes a Capture Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Capture
      def initialize(connection = CardConnect.new.connection)
        super(connection)
        @resource_name = '/capture'
        @rest_method = 'put'
      end
    end
  end
end

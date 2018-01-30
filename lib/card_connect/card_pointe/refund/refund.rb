module CardConnect
  module CardPointe
    class Refund < CardPointeEndpoint
      # Initializes a Refund Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Refund
      def initialize(connection = CardConnect.new.connection)
        super(connection)
        @resource_name = '/refund'
        @rest_method = 'put'
      end
    end
  end
end

module CardConnect
  module CardPointe
    class Inquire < CardPointeEndpoint
      # Initializes an Inquire Service
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::Service::Inquire
      def initialize(connection = Connection.new.connection)
        super(connection)
        @resource_name = '/inquire'
        @rest_method = 'get'
      end

    end
  end
end
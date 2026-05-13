module CardConnect
  module CardPointe
    class Bin < CardPointeEndpoint
      # Initializes a Bin Service for BIN (Bank Identifier Number) lookups.
      # Use to determine the funding type (credit/debit/prepaid) and other
      # card metadata for a given CardSecure token or raw account number.
      #
      # @param connection [CardConnect::Connection]
      # @return CardConnect::CardPointe::Bin
      def initialize(connection = Connection.new.connection)
        super(connection)
        @resource_name = '/bin'
        @rest_method = 'get'
      end
    end
  end
end

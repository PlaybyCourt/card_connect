module CardConnect
    class Configuration

      attr_accessor :merchant_id
      attr_accessor :api_username
      attr_accessor :api_password
      attr_accessor :endpoint
      attr_accessor :connection_options
  
      def initialize
        @connection_options = {}
      end
    end
  end
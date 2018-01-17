module CardConnect
    class Configuration

      attr_accessor :merchant_id
      attr_accessor :api_username
      attr_accessor :api_password
      attr_accessor :bolt_authorization
      attr_accessor :bolt_session_key
      attr_accessor :card_pointe_endpoint
      attr_accessor :bolt_endpoint
      attr_accessor :connection_options
  
      def initialize
        @connection_options = {}
      end
    end
  end
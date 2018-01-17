module CardConnect
  module CardPointe
    class AuthorizationResponse
      include Utils

      FIELDS = [:session_key, :expires].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        body = {}

        body[:session_key] = headers['X-CardConnect-SessionKey']
        body[:expires] = headers['expires']

        body
      end

      private

      def process_errors
        []
      end
    end
  end
end
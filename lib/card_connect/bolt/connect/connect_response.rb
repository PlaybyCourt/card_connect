module CardConnect
  module Bolt
    class ConnectResponse

      include Utils

      attr_accessor :session_key
      attr_accessor :expires

      attr_reader :errors

      def initialize(response)
        @session_key = get_session_key(response.headers["x-cardconnect-sessionkey"])
        @expires = get_expires(response.headers["x-cardconnect-sessionkey"])

        @errors = []
        process_errors
      end

      def get_session_key(session_key_string)
        session_key_string&.split(';')&.first
      end

      def get_expires(session_key_string)
        session_key_string&.split(';')&.last&.split('=')&.last
      end

      def success?
        errors.empty?
      end

      def body
        {
            session_key: @session_key,
            expires: @expires
        }
      end

      private

      def process_errors
        []
      end
    end
  end
end
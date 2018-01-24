module CardConnect
  module Bolt
    class PingResponse

      include Utils

      attr_accessor :connected

      attr_reader :errors

      def initialize(response)
        @status = response.status
        @connected = response.body["connected"]

        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        {
            status: @status,
            connected: @connected
        }
      end

      private

      def process_errors
        []
      end
    end
  end
end
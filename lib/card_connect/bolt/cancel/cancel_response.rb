module CardConnect
  module Bolt
    class CancelResponse

      include Utils

      attr_accessor :status
      attr_reader :errors

      def initialize(response)
        @status = response.status

        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        {status: @status}
      end

      private

      def process_errors
        []
      end
    end
  end
end
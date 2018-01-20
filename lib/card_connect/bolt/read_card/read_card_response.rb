module CardConnect
  module Bolt
    class ReadCardResponse

      include Utils

      attr_accessor :status, :token, :expire, :signature

      attr_reader :errors

      def initialize(response)
        @status = response.status
        @token = response.body["token"]
        @expire = response.body["expire"]
        @signature = response.body["signature"]

        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        {
          status: @status,
          token: @token,
          expire: @expire,
          signature: @signature
        }
      end

      private

      def process_errors
        []
      end
    end
  end
end
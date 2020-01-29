module CardConnect
  module Bolt
    class ReadCardResponse

      include Utils

      attr_accessor :status, :name, :token, :expiry, :signature, :single_user_token

      attr_reader :errors

      def initialize(response)
        @status = response.status
        @name = response["name"]
        @token = response.body["token"]
        @expiry = response.body["expiry"]
        @signature = response.body["signature"]
        @single_use_token = response["singleUseToken"]
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        {
          name: @name,
          status: @status,
          token: @token,
          expiry: @expiry,
          single_use_token: @single_use_token,
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
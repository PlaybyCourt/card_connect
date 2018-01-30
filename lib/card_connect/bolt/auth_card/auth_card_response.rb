module CardConnect
  module Bolt
    class AuthCardResponse
      include Utils

      FIELDS = [:token, :expiry, :signature, :name, :batchid, :retref, :avsresp,
                :respproc, :amount, :resptext, :authcode, :respcode, :merchid, :cvvresp, :respstat].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)
        set_attributes(response.body, FIELDS)
        @errors = []
        process_errors
      end

      def success?
        errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end

      private

      def process_errors
        @errors << resptext if respstat != 'A'
      end
    end
  end
end
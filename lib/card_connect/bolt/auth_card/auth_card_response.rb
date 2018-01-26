module CardConnect
  module Bolt
    class AuthCardResponse
      include Utils

      FIELDS = [:token, :expiry, :signature, :name, :batchid, :retref, :avsresp,
                :respproc, :amount, :resptext, :authcode, :respcode, :merchid, :cvvresp, :respstat].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      STATUS_APPROVED = 'A'.freeze
      STATUS_RETRY = 'B'.freeze
      STATUS_DECLINED = 'C'.freeze

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
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end

      private

      def process_errors
        @errors << resptext if [STATUS_RETRY, STATUS_DECLINED].include?(respstat)
      end
    end
  end
end
module CardConnect
  module CardPointe
    class InquireResponse
      include Utils

      FIELDS = %i[
        amount orderId resptext setlstat capturedate acctid respcode
        batchid merchid entrymode token respproc bintype profileid
        authdate lastfour name currency settledate retref respstat
        account expiry voidable refundable userfields authcode
      ].freeze

      attr_accessor(*FIELDS)
      attr_reader :errors

      def initialize(response)
        set_attributes(response, FIELDS)
        @errors = []
      end

      def success?
        @errors.empty?
      end

      def body
        body = {}
        FIELDS.each do |attr|
          body.merge!(attr => send(attr))
        end
        body
      end
    end
  end
end
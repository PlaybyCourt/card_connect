module CardConnect
  module CardPointe
    class BinResponse
      include Utils

      # Fields documented at:
      # https://developer.cardpointe.com/cardconnect-api#bin
      #
      # `success` and `errormsg` are returned when the BIN lookup itself
      # responded but no data was found for the given token/account.
      FIELDS = %i[
        country product bin cardusestring gsa corporate fsa subtype
        purchase prepaid issuer binlo binhi success errormsg
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

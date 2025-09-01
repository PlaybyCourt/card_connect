module CardConnect
  module CardPointe
    class AuthorizationRequest
      include Utils

      REQUIRED_FIELDS = [:merchid, :account, :expiry, :amount, :currency].freeze
      REQUIRED_FIELDS_FOR_ACH = [:merchid, :account, :accttype, :amount, :name].freeze

      OPTIONAL_FIELDS = [:accttype, :name, :address, :city, :region, :country, :phone,
                         :postal, :email, :ecomind, :cvv2, :orderid, :track, :bankaba,
                         :tokenize, :termid, :capture, :ssnl4, :license, :profile, :userfields,
                         :ponumber, :authcode, :invoiceid, :taxamnt, :achDescription, :cof,
                         :cofpermission, :cofscheduled, :taxexempt, :items].freeze

      FIELDS = REQUIRED_FIELDS + OPTIONAL_FIELDS

      attr_accessor(*FIELDS)
      attr_reader :errors

      # Initializes a new Authorization Request
      #
      # @param attrs [Hash]
      # @return CardConnect::AuthorizationRequest
      def initialize(attrs = {})
        @errors = []
        set_attributes(attrs, FIELDS)
        validate_required_fields
      end

      # Indicates that the request is valid once it is built.
      def valid?
        errors.empty?
      end

      # Builds the request payload
      def payload
        payload = {}
        FIELDS.each do |field|
          payload.merge!(field => send(field))
        end
        payload
      end

      private

      # Determines if the request is an ACH request
      # ESAV and ECHK are the only valid values for ACH requests
      # ESAV - Savings Account | ECHK - Checking Account
      def ach_request?
        %w[ESAV ECHK].include?(accttype)
      end

      def validate_required_fields
        required_fields = ach_request? ? REQUIRED_FIELDS_FOR_ACH : REQUIRED_FIELDS

        required_fields.each do |field|
          value = send(field)
          value.nil? || value.empty? ? errors.push("#{field.capitalize} is missing") : next
        end
      end
    end
  end
end